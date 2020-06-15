#!/bin/sh
#
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

PASSED=0
FAILED=0

header() {
    printf '\n== %s\n' "$1"
}

# usage: test_command <command> <test name>
test_command() {
    # shellcheck disable=2086
    if eval $1 >/dev/null
    then
        printf '✔ | %s\n' "$2"
        PASSED=$((PASSED+1))
    else
        printf '✖ | %s\n' "$2"
        FAILED=$((FAILED+1))
    fi
}

end() {
    printf '\n'
    printf '== completed %s tests. %s passed, %s failed.\n' \
        "$((PASSED+FAILED))" "$PASSED" "$FAILED"
}
