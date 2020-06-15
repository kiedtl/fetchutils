disk(1)

# NAME

disk - get disk usage information

# SYNOPSIS

*disk* [format] [pattern]

# DESCRIPTION

disk retrieves the disk usage information for all devices that match PATTERN
and displays it in the format specified by FORMAT.

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${fs}
:  Filesystem name (e.g. '/dev/sda5')
|  ${mnt}
:  Filesystem mount point (e.g. '/home')
|  ${b_used}
:  used space in bytes.
|  ${b_free}
:  available space in bytes.
|  ${b_total}
:  total space in bytes.
|  ${kb_used}
:  used space in KiB.
|  ${kb_free}
:  available space in KiB.
|  ${kb_total}
:  total space in KiB.
|  ${mb_used}
:  used space in MiB.
|  ${mb_free}
:  available space in MiB.
|  ${mb_total}
:  total space in MiB.
|  ${gb_used}
:  used space in GiB.
|  ${gb_free}
:  available space in GiB.
|  ${gb_total}
:  total space in GiB.

# EXAMPLES

Executing disk with no format, like so:

	disk

runs disk with the default format, '${gb_used}G / ${gb_total}G'.++
sample result: '89G / 981G'

A custom format can be used, e.g.:

```
disk '${fs} \(${mnt}\): ${gb_used}GiB / ${gb_total}GiB \\
	\($(((gb_used*100)/gb_total))%\)' '/$'
```

sample result: '/dev/sda2 (/): 150GiB / 983GiB (15%)'

Note how the pattern must be specified if a custom format is used.

Also note that parenthesis must be escaped in the format string; this
is mainly due to the format string being an actual sh expression that
is evaluated to expand it. See fetchutils(1) for more info.

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

*fetchutils*(1)

The full documentation for *disk* is not maintained as a Texinfo manual.
If the *info* and *disk* programs are properly installed on your system,
the command

	*info disk*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
