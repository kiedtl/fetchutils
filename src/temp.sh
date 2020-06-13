#!/bin/sh
#
# http://github.com/mitchweaver/bin
#
# get CPU temperature
#

[ -z "$1" ] && set -- '${c}°C'

c=

case $(uname -s) in
    FreeBSD*)
        # TODO: freebsd
    ;;
    OpenBSD*)
        c=$(sysctl -n hw.sensors.cpu0.temp0)
        c="${c%.*}"
    ;;
    Linux*)
        read -r c </sys/class/thermal/thermal_zone0/temp
        c="${c%???}"
    ;;
    *)
        echo unsupported os: $(uname -s)
        exit 1
    ;;
esac

eval echo "$1"
