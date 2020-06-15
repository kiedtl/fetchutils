#!/bin/sh
#
# wm - get window manager
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

[ -z "$DISPLAY" ] && {
    echo "could not find display" >&2
    exit 1
}

wm="$(xprop -root -notype _NET_WM_NAME)"
wm="${wm##*= \"}"
wm="${wm%%\"*}"

printf '%s\n' "$wm"
