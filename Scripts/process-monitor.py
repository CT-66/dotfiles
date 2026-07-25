#!/usr/bin/env python3

import psutil
import time
import csv
import os
import signal
import argparse
import threading
import termios
import tty
import sys

import pandas as pd
import matplotlib.pyplot as plt

# ----------------------------------------
# Arguments
# ----------------------------------------

parser = argparse.ArgumentParser()

parser.add_argument(
    "--pid",
    type=int,
    help="Process PID"
)

parser.add_argument(
    "--name",
    type=str,
    help="Process name"
)


parser.add_argument(
    "--interval",
    type=float,
    default=1.0,
    help="Sampling interval in minutes"
)

args = parser.parse_args()

# ----------------------------------------
# Globals
# ----------------------------------------

RUNNING = True

outfile = f"/tmp/proc_monitor_{args.pid}.csv"

# proc = psutil.Process(args.pid)
# ----------------------------------------
# Process lookup
# ----------------------------------------

proc = None

if args.pid:

    proc = psutil.Process(args.pid)

elif args.name:

    for p in psutil.process_iter(['pid', 'name']):

        if p.info['name'] == args.name:

            proc = psutil.Process(p.info['pid'])

            break

if proc is None:

    print("Process not found")
    exit(1)

args.pid = proc.pid

# Prime CPU counter
proc.cpu_percent(interval=None)

# ----------------------------------------
# Sampling Thread
# ----------------------------------------

def sampler():

    with open(outfile, "a", newline="") as f:

        writer = csv.writer(f)

        if os.stat(outfile).st_size == 0:
            writer.writerow([
                "timestamp",
                "cpu_percent",
                "memory_mb"
            ])

        while RUNNING:

            try:
                timestamp = time.time()

                cpu = proc.cpu_percent(interval=None)

                # mem = (
                #     proc.memory_info().rss /
                #     (1024 * 1024)
                # )
                mem = proc.memory_info().rss / 1_000_000

                writer.writerow([
                    timestamp,
                    cpu,
                    mem
                ])

                f.flush()

                print(
                    f"\rCPU: {cpu:6.2f}%   "
                    f"MEM: {mem:8.2f} MB",
                    end="",
                    flush=True
                )

                time.sleep(args.interval * 60)

            except psutil.NoSuchProcess:
                print("\nProcess exited.")
                os._exit(0)

# ----------------------------------------
# Plot Function
# ----------------------------------------

def plot_graph():

    if not os.path.exists(outfile):
        print("\nNo data yet.")
        return

    df = pd.read_csv(outfile)

    if len(df) < 2:
        print("\nNot enough samples.")
        return

    df["time_min"] = (
        df["timestamp"] -
        df["timestamp"].iloc[0]
    ) / 60

    fig, ax1 = plt.subplots(figsize=(12, 6))

    ax1.plot(
        df["time_min"],
        df["cpu_percent"],
        color="blue"
    )

    ax1.set_xlabel("Time (minutes)")
    ax1.set_ylabel("CPU %", color="blue")

    ax2 = ax1.twinx()

    ax2.plot(
        df["time_min"],
        df["memory_mb"],
        color="orange"
    )

    ax2.set_ylabel(
        "Memory (MB)",
        color="orange"
    )

    plt.title(
        f"PID {args.pid} Resource Usage"
    )

    plt.tight_layout()

    print("\nOpening graph window...")

    plt.show()

    print("Graph closed. Monitoring continues.")

# ----------------------------------------
# Key Listener
# ----------------------------------------

def key_listener():

    global RUNNING

    fd = sys.stdin.fileno()

    old_settings = termios.tcgetattr(fd)

    try:
        tty.setcbreak(fd)

        while RUNNING:

            ch = sys.stdin.read(1)

            # Ctrl+C
            if ord(ch) == 3:
                RUNNING = False
                break

            # Ctrl+O
            elif ord(ch) == 15:
                plot_graph()

    finally:
        termios.tcsetattr(
            fd,
            termios.TCSADRAIN,
            old_settings
        )

# ----------------------------------------
# Main
# ----------------------------------------

print(f"Monitoring PID {args.pid}")
print(f"Writing to {outfile}")
print("Ctrl+O => Open graph")
print("Ctrl+C => Exit")

thread = threading.Thread(
    target=sampler,
    daemon=True
)

thread.start()

key_listener()

print("\nExiting.")
