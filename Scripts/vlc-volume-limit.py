#!/usr/bin/python3

import time
import pulsectl
import subprocess

THRESHOLD = 1.0  # volume > 1.0 means > 100%
INTERVAL = 2     # seconds

def send_notification(volume_percent):
    subprocess.run([
        'notify-send',
        '-u', 'critical',
        'VLC Volume Alert',
        f'Volume above 100%: {volume_percent:.1f}%'
    ])

def main():
    pulse = pulsectl.Pulse('vlc-volume-watcher')

    while True:
        try:
            inputs = pulse.sink_input_list()
            for inp in inputs:
                app_name = inp.proplist.get('application.name', '')
                if 'vlc' in app_name.lower():
                    vol = inp.volume.value_flat  # average volume (0.0-∞)
                    if vol > THRESHOLD:
                        send_notification(vol * 100)
        except Exception as e:
            print(f'Error: {e}')
        time.sleep(INTERVAL)

if __name__ == "__main__":
    main()
