#!/bin/sh
#
# mem - get memory usage information
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

# TODO:
#    - cleanup!
#    - percentage_used variables
#    - precision control (use dc instead of builtin)
#    - differenciate between GiB and GB, etc

[ -z "$1" ] && set -- '${mb_used}M / ${mb_total}M'

get_mem_linux() {
    while IFS=: read -r set data; do
        data="${data%%kB}"

        case "$set" in
            MemTotal)
                kb_used=$((kb_used+=data))
                kb_total=$((kb_total=data))
            ;;

            Shmem)
                kb_used=$((kb_used+=data))
            ;;

            MemFree|Buffers|Cached|SReclaimable)
                kb_used=$((kb_used-=data))
            ;;
        esac
    done < /proc/meminfo

    b_used=$((kb_used*1024))
    b_total=$((kb_total*1024))
    mb_used=$((kb_used/1024))
    mb_total=$((kb_total/1024))
    gb_used=$((mb_used/1024))
    gb_total=$((mb_total/1024))

    b_free=$((b_total-b_used))
    kb_free=$((kb_total-kb_used))
    mb_free=$((mb_total-mb_used))
    gb_free=$((gb_total-gb_used))
}

get_mem_freebsd() {
    b_total=$(sysctl -n hw.physmem)

    # thanks, neofetch! :P
    pagesize="$(sysctl -n hw.pagesize)"
    inactive="$(($(sysctl -n vm.stats.vm.v_inactive_count) * pagesize))"
    unused="$(($(sysctl -n vm.stats.vm.v_free_count) * pagesize))"
    cache="$(($(sysctl -n vm.stats.vm.v_cache_count) * pagesize))"

    b_free="$((inactive + unused + cache))"
    b_used=$((b_total - b_free))
    kb_used=$((b_used/1024))
    kb_total=$((b_total/1024))
    mb_used=$((kb_used/1024))
    mb_total=$((kb_total/1024))
    gb_used=$((mb_used/1024))
    gb_total=$((mb_total/1024))

    kb_free=$((b_free/1024))
    mb_free=$((kb_free/1024))
    gb_free=$((mb_free/1024))
}

case "$(uname -s)" in
    Linux*) get_mem_linux ;;
    FreeBSD*) get_mem_freebsd ;;

    *)
        echo "unsupported os: $(uname -s)";
        exit 1
    ;;
esac

eval echo "$1"
