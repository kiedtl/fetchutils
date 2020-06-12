PKGS(1)

# NAME

pkgs - count installed packages

# SYNOPSIS

*pkgs* [format]

# DESCRIPTION

pkgs counts all packages installed with installed package managers.

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${total}
:  Total amount of installed packages.
|  ${pkgs_total}
:  Like ${total}, but lists package managers. (See EXAMPLES)
|  ${pkgs_tiny_total}
:  Like ${pkgs_total}, but lists package managers in the tiny format. (See EXAMPLES)

# EXAMPLES

Executing pkgs with no format, like so:

	pkgs

runs pkgs with the default format, '${total}'.++
sample result: '1024'

Here's a comparison of '${total}', '${pkgs_total}', and '${pkgs_tiny_total}'.++
The following commands executed on the author's system:

	pkgs '${total}'++
pkgs '${pkgs_total}'++
pkgs '${pkgs_tiny_total}'

yields the output:

	2941++
2936 (apt) 5 (snap)++
2941 (apt, snap)

As you can see, both '${pkgs_total}' and '${pkgs_tiny_total}' list
package managers, but '${pkgs_tiny_total}' does so in a more concise way.

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

The full documentation for *pkgs* is not maintained as a Texinfo manual.
If the *info* and *pkgs* programs are properly installed on your system,
the command

	*info pkgs*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
