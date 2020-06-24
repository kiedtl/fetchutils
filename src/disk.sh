#!/bin/sh
#
# disk [fmt] [drive] - get disk usage
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

# TODO:
#    - precision control (use dc instead of builtin)
#    - differenciate between GiB and GB, etc

: ${FU_SCALE=0}
[ -z "$1" ] && set -- '${gb_used}G / ${gb_total}G' '/$'

df | sed '1d' | grep "$2" | \
    while read -r fs kb_total kb_used kb_free _ mnt
    do
        b_free=$(dc -e "${FU_SCALE}k $kb_free 1024 * p")
        b_used=$(dc -e "${FU_SCALE}k $kb_used 1024 * p")
        b_total=$(dc -e "${FU_SCALE}k $kb_total 1024 * p")

        mb_free=$(dc -e "${FU_SCALE}k $kb_free 1024 / p")
        mb_used=$(dc -e "${FU_SCALE}k $kb_used 1024 / p")
        mb_total=$(dc -e "${FU_SCALE}k $kb_total 1024 / p")

        gb_free=$(dc -e "${FU_SCALE}k $mb_free 1024 / p")
        gb_used=$(dc -e "${FU_SCALE}k $mb_used 1024 / p")
        gb_total=$(dc -e "${FU_SCALE}k $mb_total 1024 / p")

        eval echo "$1"
    done
