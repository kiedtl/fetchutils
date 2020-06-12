RES(1)

# NAME

res - get screen resolution

# SYNOPSIS

*res* [format]

# DESCRIPTION

res retrieves the screen resolution in an X11 session.

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${height}
:  height of screen in pixels.
|  ${width}
:  width of screen in pixels.

# EXAMPLES

Executing res with no format, like so:

	res

runs res with the default format, '${height}x${width}'.++
sample result: '1920x1080'

A custom format can be used, e.g.:

	res '${height}px high, ${width}px wide'

sample result: '1920px high, 1080px wide'

# KNOWN ISSUES

- res does not work on Wayland.

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

The full documentation for *res* is not maintained as a Texinfo manual.
If the *info* and *res* programs are properly installed on your system,
the command

	*info res*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
