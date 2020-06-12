TEMP(1)

# NAME

temp - get CPU temperature

# SYNOPSIS

*temp* [format]

# DESCRIPTION

temp retrieves the CPU temperature.

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${c}
:  Temperature in degrees Celsius


# EXAMPLES

Executing temp with no format, like so:

	temp

runs temp with the default format, '${c}°C'.++
sample result: '48°C'

A custom format can be used, e.g.:

	temp '${c} degrees Celsius'

sample result: '49 degrees Celsius'

# KNOWN ISSUES

- temp does not have a format specifier for the temperature in Fahrenheit.
- temp does not have a format specifier for the temperature in Kelvin.

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

The full documentation for *temp* is not maintained as a Texinfo manual.
If the *info* and *temp* programs are properly installed on your system,
the command

	*info temp*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
