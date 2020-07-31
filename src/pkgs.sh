#!/bin/sh
#
# pkgs - get number of pkgs
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

# total amount of packages
total=

# total with package manager
# e.g. "456 (xbps) 12 (snap) 1 (flatpack)"
pkgs_total=

# total with package manager, tiny version
# e.g. "469 (xbps, snap, flatpack)"
pkgs_tiny_total=

# a list of package managers used.
# used to construct $pkgs_total at the end
pkg_managers=

fmt="${1:-\$total}"

getpkgs() {
    total="$((total+$2))"
    pkgs_total="$pkgs_total $2 ($1)"
    pkg_managers="$pkg_managers $1"
}

command -v apk 2>/dev/null >&2 && \
    getpkgs apk "$(apk list -I | wc -l)"

command -v dpkg 2>/dev/null >&2 && \
    getpkgs apt "$(dpkg --get-selections | \
        grep -cv deinstall)"

command -v kiss 2>/dev/null >&2 && \
    getpkgs kiss "$(kiss list | wc -l)"

command -v snap 2>/dev/null >&2 && \
    getpkgs snap "$(snap list | wc -l)"

command -v pacman 2>/dev/null >&2 && \
    getpkgs pacman "$(pacman -Qq | wc -l)"

command -v pkg 2>/dev/null >&2 && \
    getpkgs pkg \
        "$(pkg stats | awk '/Installed packages:/ { print $3 }')"

command -v xbps-query 2>/dev/null >&2 && \
    getpkgs xbps "$(xbps-query -l | wc -l)"

# generate $pkgs_tiny_total
pkgs_tiny_total="$total ("

# shellcheck disable=2086
set -- $pkg_managers

while [ $# -gt 0 ]; do
    pkgs_tiny_total="${pkgs_tiny_total}$1, "
    shift
done

pkgs_tiny_total="${pkgs_tiny_total%,\ }"
pkgs_tiny_total="${pkgs_tiny_total})"

eval echo "$fmt"
