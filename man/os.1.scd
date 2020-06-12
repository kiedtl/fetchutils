OS(1)

# NAME

os - get operating system or Linux distro name

# SYNOPSIS

*os* [format]

# DESCRIPTION

os retrieves the name and id of the current distro (in the case of Linux),
or the operating system name in the case of another system (such as BSD).

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${name}
:  NAME from /etc/os-release on Linux, or lowercase output of `uname -s` on other os's.
|  ${id}
:  ID from /etc/os-release on Linux, or output of `uname -s` on other os's.
|  ${pretty_name}
:  PRETTY_NAME from /etc/os-release on Linux, or output of `uname -s` on other os's.

# EXAMPLES

Executing os with no format, like so:

	os

runs os with the default format, '${name}'.++
sample result on Linux: 'Ubuntu'++
sample result on FreeBSD: 'FreeBSD'

A custom format can be used, e.g.:

	os '${name},${id},${pretty_name}'

sample result on Linux: 'Ubuntu,debian,Ubuntu 18.04.4 LTS'++
sample result on FreeBSD: 'FreeBSD,freebsd,FreeBSD'

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

The full documentation for *os* is not maintained as a Texinfo manual.
If the *info* and *os* programs are properly installed on your system,
the command

	*info os*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
