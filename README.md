# fetchutils

This is a collection of small (< ~100 LOC) POSIX shell scripts to retrieve
system information, such as uptime, memory, resolution, etc. They all
output information in *plain text*, enabling them to be used for multiple
purposes:

- used to get info for a status bar (e.g. `lemonbar`)
- used to create a super fast, highly customizable fetch script
- used standalone (*what's my resolution again?*)

## goals

- `fetchutils` scripts should be as readable as possible under the
   constraints of the glorious POSIX shell,
- as highly customizable as possible,
- and should support most major Linux distros, OpenBSD, and FreeBSD.

## non-goals

- duplicating existing functionality, `uname`, `hostname`, `$SHELL`, etc.
- replacing Neofetch, Screenfetch, ufetch, etc.
- supporting every Linux distro under the sun.
- supporting DragonflyBSD or NetBSD (not right now, anyway. sorry).
- implementing a colorblocks script.
	- such a script would require so much flexibility it's just better
	that users write their own.

## installation

Ensure that:
- GNU Make is installed.
	- BSD Make isn't supported. (This is planned.)
- You are using a supported OS.
	- FreeBSD support is only partial.
	- OpenBSD support is planned.
	- Linux should work out of the box.
- [`scdoc`](https://git.sr.ht/~sircmpwn/scdoc) is installed.
	- Optional, but required to generate manpages.

Execute:

```
$ make
# make PREFIX=<prefix> install
```

## usage

Each tool accepts a *format* string as its argument. Most tools already
have a default format string:

```
$ mem
3005M / 8053M
```

In this case, `mem`'s default format string is
`${mb_used}M / ${mb_total}M`, where each `${}` is a format specifier.

Changing it gives the result:

```
$ mem '${gb_used}GB used out of ${gb_total}GB'
3GB used out of 8GB
```

Each tool has a man page (in `man/`) giving details such as the available
specifiers and some nice examples.

See the man page (`fetchutils(1)`) for more information on format strings.

## building a fetch script

Because these tools output info in plain text, with no ASCII art or
terminal styling, it's really easy to build your own fetch script using
them.

Here's a really simple one (from `contrib/simple`):
```
#!/bin/sh

echo "
    ___     ${USER}@$(hostname)
   (.. |    os: $(../src/os)
   (<> |    shell: ${SHELL}
  / __  \   pkgs: $(../src/pkgs '$pkgs_total')
 ( /  \ /|  uptime: $(../src/upt)
_/\ __)/_)  memory: $(../src/mem)
\/_____\/   kernel: $(uname -r)
" 2>/dev/null
```

Which, on my system, gives the following output:

```
    ___     kiedtl@foobar
   (.. |    os: FreeBSD
   (<> |    shell: mksh
  / __  \   pkgs: 270 (pkg)
 ( /  \ /|  uptime: 187d 22h 29m
_/\ __)/_)  memory: 2209M / 4053M
\/_____\/   kernel: 12.1-RELEASE-p1
```

As you can see, it just wraps the output of the various `fetchutils`
utilities, and displays it with some ASCII art.

Take a look at the various script in `contrib/` if you want to see
more examples of how fetchutils can be used to create a fetch script.

## why?

"Normal" fetch scripts (such as ufetch or Neofetch) are good enough for
most people.

However, I've noticed a significant amount of people just end up writing
their own fetch script, mostly because they wanted to try a new layout or
look that other fetch tools don't support (e.g. the `contrib/nice` script).

Instead of giving you a full-blown fetch tool, fetchutils offers you the
tools needed to write your own.

## contributing

As you may have noticed, I'm terrible at explaining anything, so if you
understood anything at all and feel you can improve this README, feel
free to submit a patch via the GitHub pull requests.

Oh, and if you want to help improve the actual scripts, then that would be
great too :^)

## license

These lame little utilities are licensed under the MIT license.
