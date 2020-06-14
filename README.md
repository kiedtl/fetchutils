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
  Instead, these tools simply extract the needed information from these
  tools and format them as desired.
- replacing Neofetch, Screenfetch, ufetch, etc.
- supporting every Linux distro under the sun.
- supporting DragonflyBSD or NetBSD (not right now, anyway. sorry).
- implementing a colorblocks script.
	- such a script would require so much flexibility it's just better
	that users write their own.

## installation

Copy the scripts from `src/` into your directory of choice (e.g.
`/usr/local/bin`). In the future, a `Makefile` will be provided to automate
this.

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

## why?

"Normal" system info scripts (such as Screenfetch) have many issues:

- They are more or less unreadable due to the huge size of the script.
  (this doesn't necessarily apply to the smaller ones, like `ufetch`)
- They are not fully customizable.
- They do not output information in plain text.

The last one is actually a feature for some, as many do not have the skills
or time to build their own fetch script as described in the previous
section. However, for those that do, these fetch tools can be immensely
useful, as they are ridiculously customizable compared to other prebuilt
fetch tools, thanks to their format strings.

## contributing

As you may have noticed, I'm terrible at explaining anything, so if you
understood anything at all and feel you can improve this README, feel
free to submit a patch via the GitHub pull requests.

Oh, and if you want to help improve the actual scripts, then that would be
great too :^)

## license

These lame little utilities are licensed under the MIT license.
