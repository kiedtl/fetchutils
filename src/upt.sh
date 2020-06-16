#!/bin/sh
#
# upt - get uptime on hosts
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

[ -z "$1" ] && set -- '${d} ${h} ${m}'

case $(uname -s) in
    Linux*)
        secs=$(cat /proc/uptime)
        secs=${secs%%.*}
    ;;

    *BSD*)
        boottime=$(sysctl -n kern.boottime | \
            sed 's/{ sec = //g; s/,.*//g')
        now=$(date +%s)

        secs=$((now - boottime))
    ;;

    *)
        echo "unsupported os: $(uname -s)" >&2
        exit 1
    ;;
esac

days=$((secs/86400))
hours=$((secs/3600%24))
mins=$((secs/60%60))

[ $days  = 0 ] || d="${days}${UPT_DAY_SUFFIX:-d}"
[ $hours = 0 ] || h="${hours}${UPT_HOUR_SUFFIX:-h}"
[ $mins  = 0 ] || m="${mins}${UPT_MIN_SUFFIX:-m}"
[ $secs  = 0 ] || s="${secs}${UPT_SEC_SUFFIX:-s}"

eval echo "$1"
