#!/bin/sh
#
# os - get operating system
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

[ -z "$1" ] && set -- '$name'

get_os_linux() {
    while IFS='=' read -r key val
    do
        val=${val%\"}
        val=${val#\"}

        case "$key" in
            ID*) id="$val" ;;
            PRETTY_NAME*) pretty_name="$val" ;;
            NAME*) name="$val" ;;
        esac
    done < /etc/os-release
}

get_os_other() {
    # cache output of uname
    uname=$(uname -s)

    id=$(echo "$uname" | tr '[:upper:]' '[:lower:]')
    pretty_name=$uname
    name=$uname
}

case $(uname -s) in
    Linux*) get_os_linux ;;
    *) get_os_other ;;
esac

eval echo "$1"
