#!/bin/sh
#
# http://github.com/mitchweaver/bin
#
# get CPU temperature
#

[ -z "$1" ] && set -- '${c}°C'

c=

case $(uname -s) in
    OpenBSD*)
        c=$(sysctl -n hw.sensors.cpu0.temp0)
        c="${c%.*}"
    ;;
    Linux*)
        path=/sys/class/thermal/thermal_zone0/temp
        if [ -f $path ]
        then
            read -r c < $path
        else
            echo "could not get temperature" >&2
            exit 1
        fi

        c="${c%???}"
    ;;
    *)
        echo "unsupported os: $(uname -s)" >&2
        exit 1
    ;;
esac

eval echo "$1"
