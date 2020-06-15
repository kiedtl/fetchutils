EDITOR(1)

# NAME

editor - get editor

# SYNOPSIS

*editor* [format]

# DESCRIPTION

editor retrieves the default editor set in $EDITOR or $VISUAL and tries
to get it's name and version. For example, given that $EDITOR is set to
'emacs', the output would be 'GNU Emacs 25.2.2'

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${name}
:  the unmodified value of $EDITOR or $VISUAL, e.g. "emacs"
|  ${full_name}
:  the full name of the editor, e.g. "gnu emacs"
|  ${pretty_name}
:  like the full_name, but with capitalization. e.g. "GNU Emacs"
|  ${version}
:  the version of the editor.

# EXAMPLES

Executing editor with no format, like so:

	editor

runs editor with the default format, '$pretty_name'.++
sample result: 'GNU Emacs'

A custom format can be used, e.g.:

	editor '$name v$version'

sample result: 'emacs v25.2.2'


# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

*fetchutils*(1)

The full documentation for *editor* is not maintained as a Texinfo manual.
If the *info* and *editor* programs are properly installed on your system,
the command

	*info editor*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
