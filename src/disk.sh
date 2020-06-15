#!/bin/sh
#
# disk [fmt] [drive] - get disk usage
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

# TODO:
#    - precision control (use dc instead of builtin)
#    - differenciate between GiB and GB, etc

[ -z "$1" ] && set -- '${gb_used}G / ${gb_total}G' '/$'

df | sed '1d' | grep "$2" | \
    while read -r fs kb_total kb_used kb_free _ mnt
    do
        b_free=$((kb_free*1024))
        b_used=$((kb_used*1024))
        b_total=$((kb_total*1024))

        mb_free=$((kb_free/1024))
        mb_used=$((kb_used/1024))
        mb_total=$((kb_total/1024))

        gb_free=$((mb_free/1024))
        gb_used=$((mb_used/1024))
        gb_total=$((mb_total/1024))

        eval echo "$1"
    done
