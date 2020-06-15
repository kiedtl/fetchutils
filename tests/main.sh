#!/bin/sh
#
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

. tests/lib.sh

SHCHK_FLAGS="-e2016 -e2034"

header "testing for needed programs"
test_command "command -v scdoc 2>/dev/null >&2" \
    "scdoc installed"
test_command "command -v shellcheck 2>/dev/null >&2" \
    "shellcheck installed"

header "linting source files"
for file in src/*
do
    test_command "shellcheck $SHCHK_FLAGS $file" \
        "passed shellcheck: '$file'"
done

header "linting example scripts"
for file in contrib/*
do
    test_command "shellcheck $SHCHK_FLAGS $file" \
        "passed shellcheck: '$file'"
done

header "linting tests files"
test_command "shellcheck $SHCHK_FLAGS tests/main.sh tests/lib.sh" \
    "passed shellcheck: tests/main.sh tests/lib.sh"

header "checking manpages compile with scdoc"
for file in man/*.1.scd
do
    test_command "cat $file | scdoc" \
        "passed scdoc: '$file'"
done

end
