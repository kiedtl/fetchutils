FETCHUTILS(1)

# NAME

fetchutils - a collection of small utilities to get system info

# SYNOPSIS

*<applet>* [args]

# DESCRIPTION

fetchutils is a collection of small shell scrip to quickly get system
information.

(Almost) every tool accepts a format specifier as an argument, an
occasionally a few other arguments. The format specifier is simply a
shell expression, e.g. "${format1} ${format2}". In the previous example,
'${format1}' and '${format2}' are both format specifiers, similar to
/bin/printf's format specifiers (like %s and %d).

Example: assume a tool foo.sh, which has the available formats 'value1'
and 'value2', where the format specifiers '$fmt1' maps to 'value1' and
'$fmt2' maps to 'value2'. If the tool is given the format

```
"1st value: $fmt1, 2nd value: $fmt2"
```

The final result will be

```
"1st value: value1, 2nd value: value2"
```

As you can see, both '$fmt1' and '$fmt2' were expanded to their respective
values, regardless of the text next to it.

Because each format string is simply a shell expression, it's also possible
to use shell command in the format string:

```
"1st value: $fmt1, modified 2nd value: ${fmt%2}"
```

The above example yields the result:

```
"1st value: value1, modified 2nd value: value"
```

Where the '2' in 'value2' is removed because of the shell expression
'${fmt%2}', which removed the last character from the string.

This simple feature allows fetchutils to output information in *any* format,
unlike traditional fetch tools. This enables fetchutils to be used in
a variety of areas, such as lemonbar scripts, in addition to custom fetch
scripts.

# APPLETS

[[ *name*
:< description
|  disk
:  Get disk usage info.
|  editor
:  Get editor and find it's pretty name.
|  mem
:  Get memory usage info.
|  os
:  Get the Linux distro name (on Linux) or the OS (on other systems).
|  pkgs
:  Get installed package count.
|  res
:  Get screen resolution.
|  temp
:  Get CPU temperature.
|  upt
:  Get system uptime.
|  wm
:  Get window manager name.

See the *SEE ALSO* section below for links to each applet's manpage.

# EXAMPLES

See each tool's manpage for examples.

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

Any attempts at improving this lousy manpage would be greatly appreciated.

# SEE ALSO

*disk*(1), *editor*(1), *mem*(1), *os*(1), *pkgs*(1), *res*(1), *temp*(1),
*upt*(1), *wm*(1)

The full documentation for *fetchutils* is not maintained as a Texinfo
manual.
If the *info* and *fetchutils* programs are properly installed on your
system, the command

	*info fetchutils*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn and contributors

This utility is licensed under the MIT license.
