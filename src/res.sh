#!/bin/sh
#
# original version sto^H^H^Hborrowed from
# http://github.com/mitchweaver/bin
#
# res: get screen dimensions
#

[ -z "$1" ] && set -- '${height}x$width'
[ -z "$DISPLAY" ] && {
    echo "could not find display" >&2
    exit 1
}

res=$(xrandr --nograb --current | awk '/\*/ {print $1}' | tail -n 1)
res=${res% *}

width=${res%x*}
width=${width%.*}

height=${res#*x}
height=${height%.*}

eval echo "$1"
