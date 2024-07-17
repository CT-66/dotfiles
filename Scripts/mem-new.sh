#!/bin/bash

# MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
# Source: https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716
while IFS=":" read -r a b; do
    case $a in
        "MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
        "Shmem") ((mem_used+=${b/kB}))  ;;
        "MemFree" | "Buffers" | "Cached" | "SReclaimable")
            mem_used="$((mem_used-=${b/kB}))"
        ;;

        # Available since Linux 3.14rc (34e431b0ae398fc54ea69ff85ec700722c9da773).
        # If detected this will be used over the above calculation for mem_used.
        "MemAvailable")
            mem_avail=${b/kB}
        ;;
    esac
done < /proc/meminfo

if [[ $mem_avail ]]; then
    mem_used=$(((mem_total - mem_avail) / 1024))
else
    mem_used="$((mem_used / 1024))"
fi

mem_total="$((mem_total / 1024))"

[[ "$memory_percent" == "on" ]] && ((mem_perc=mem_used * 100 / mem_total))

case $memory_unit in
    gib)
        mem_used=$(awk '{printf "%.2f", $1 / $2}' <<< "$mem_used 1024")
        mem_total=$(awk '{printf "%.2f", $1 / $2}' <<< "$mem_total 1024")
        mem_label=GiB
    ;;

    kib)
        mem_used=$((mem_used * 1024))
        mem_total=$((mem_total * 1024))
        mem_label=KiB
    ;;
esac

memory="${mem_used}${mem_label:-MiB} / ${mem_total}${mem_label:-MiB} ${mem_perc:+(${mem_perc}%)}"


echo "$memory"

#### neofetch still shows the intended memory, but this script somehow shows actual memory which is not intended despite using the same code?
#### edit the existing mem.sh ans memory plasmoid with this updated script
