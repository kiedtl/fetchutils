#!/bin/sh
#
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

SHCHK_FLAGS="-x -e2016 -e2034"

. tests/lib.sh

header "testing for needed programs"
test_command "command -v scdoc 2>/dev/null >&2" \
    "scdoc installed"
test_command "command -v shellcheck 2>/dev/null >&2" \
    "shellcheck installed"

header "linting source files"
for file in src/*
do
    test_shchk "$file"
done

header "linting example scripts"
for file in contrib/*
do
    test_shchk "$file"
done

header "linting tests files"
test_shchk "tests/main.sh"
test_shchk "tests/lib.sh"

header "checking manpages compile with scdoc"
for file in man/*.1.scd
do
    test_command "cat $file | scdoc" \
        "passed scdoc: '$file'"
done

end
