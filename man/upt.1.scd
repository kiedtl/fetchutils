UPT(1)

# NAME

upt - get uptime

# SYNOPSIS

*upt* [format]

# DESCRIPTION

upt retrieves the system uptime and formats it according to the provided
format string.

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${d}
:  days of uptime.
|  ${h}
:  hours of uptime (does not include days).
|  ${m}
:  minutes of uptime (does not include hours).
|  ${s}
:  total amount of seconds elapsed since boot.

## ENVIRONMENT VARIABLES

In addition to the usual format specifiers, upt uses environment variables
to specify the suffixes used for the day, hours, minutes, etc values.

[[ *environment variable*
:< description
|  $UPT_DAY_SUFFIX
:  days suffix. default: 'd'
|  $UPT_HOUR_SUFFIX
:  hours suffix. default: 'h'
|  $UPT_MIN_SUFFIX
:  minutes suffix. default: 'm'
|  $UPT_SEC_SUFFIX
:  seconds suffix. default: 's'

# EXAMPLES

Executing upt with no format, like so:

	upt

runs upt with the default format, '${d} ${h} ${m}'.++
sample result: '187d 21h 8m'

Custom format and suffixes can be used, e.g.:

	UPT_DAY_SUFFIX=' days' \\++
	UPT_HOUR_SUFFIX=' hours' \\++
	UPT_MIN_SUFFIX=' minutes' \\++
	upt '${d}, ${h}, and ${m}'

sample result: '114 days, 22 hours, and 25 minutes'


# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

The full documentation for *upt* is not maintained as a Texinfo manual.
If the *info* and *upt* programs are properly installed on your system,
the command

	*info upt*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
