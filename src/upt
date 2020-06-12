#!/bin/sh
#
# upt - get uptime on hosts
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

[ -z "$1" ] && set -- '${d} ${h} ${m}'

case $(uname -s) in
    Linux*)
        s=$(cat /proc/uptime)
        s=${s%%.*}
    ;;

    *BSD*)
        boottime=$(sysctl -n kern.boottime | \
            sed 's/{ sec = //g; s/,.*//g')
        now=$(date +%s)

        s=$((now - boottime))
    ;;

    *)
        echo unsupported os: $(uname -s)
        exit 1
    ;;
esac

d=$((s/86400))
h=$((s/3600%24))
m=$((s/60%60))

[ $d = 0 ] || d="${d}${UPT_DAY_SUFFIX:-d}"
[ $h = 0 ] || h="${h}${UPT_HOUR_SUFFIX:-h}"
[ $m = 0 ] || m="${m}${UPT_MIN_SUFFIX:-m}"
[ $s = 0 ] || s="${s}${UPT_SEC_SUFFIX:-s}"

eval echo "$1"
