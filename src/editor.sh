#!/bin/sh
#
# editor - get editor name
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

[ -z "$1" ] && set -- '$pretty_name'

name='' full_name='' pretty_name='' version=''

name="${EDITOR:-${VISUAL:-vi}}"
case "$name" in
    *code*)
        full_name='vs code'
        pretty_name='VS Code'
        version='?' # HELP WANTED!
    ;;

    *emacs*)
        full_name='gnu emacs'
        pretty_name='GNU Emacs'
        version="$(emacs --version | \
            head -n1 | awk '{ print $NF }')"
    ;;

    *nvim*)
        full_name='neovim'
        pretty_name='Neovim'
        version="$(nvim --version | \
            head -n1 | awk '{ print $NF }')"
    ;;

    *vim*)
        full_name='vim'
        pretty_name='Vim'
        version="$(vim --version | head -n1)"
        version="${version##*proved }"
        version="${version%%\ \(*}"
    ;;

    *nano*)
        full_name='nano'
        pretty_name='Nano'
        version="$(nano --version | \
            head -n1 | awk '{ print $NF }')"
    ;;

    *)
        full_name=$name pretty_name=$name
        version="$($name --version | \
            head -n1 | awk '{ print $NF }')"
esac

eval echo "$1"
