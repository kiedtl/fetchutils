MEM(1)

# NAME

mem - get memory usage

# SYNOPSIS

*mem* [format]

# DESCRIPTION

mem retrieves the amount of memory used, the amount of free memory, and the total amount of memory in bytes, KiB, MiB, and GiB.

## FORMAT SPECIFIERS

[[ *name*
:< description
|  ${b_used}
:  bytes of used memory
|  ${b_free}
:  bytes of free memory
|  ${b_total}
:  bytes of total memory
|  ${kb_used}
:  KiB of used memory
|  ${kb_free}
:  KiB of free memory
|  ${kb_total}
:  KiB of total memory
|  ${mb_used}
:  MiB of used memory
|  ${mb_free}
:  MiB of free memory
|  ${mb_total}
:  MiB of total memory
|  ${gb_used}
:  GiB of used memory
|  ${gb_free}
:  GiB of free memory
|  ${gb_total}
:  GiB of total memory

# EXAMPLES

Executing mem with no arguments, like so:

	mem

runs mem with the default format, '${mb_used}M / ${mb_total}M'.++
sample result: 2726M / 4053M

A custom format may be used, e.g.:

	mem '${gb_used}G used out of ${gb_total}'

This will run mem with the format '<USED>G used out of <TOTAL>G'.++
sample result: 3G used out of 4G

A more complex (and extremely messy) example:

```
mem '${b_used} ${b_total}' | \
        awk '{
                p=($1*10)/$2
                printf "[%0*s%*s]\n", p, "", 10 - p, ""
        }' | \
        sed 's/0/#/g'
```

Here, the raw output of mem in bytes is piped to awk and used to create a
bar showing the memory consumption.++
sample result: [#######  ]

# REPORTING BUGS

Please report any bugs to _https://github.com/lptstr/fetchutils/issues_ or
to _kiedtl@tilde.team_.

# SEE ALSO

The full documentation for *mem* is not maintained as a Texinfo manual.
If the *info* and *mem* programs are properly installed on your system,
the command

	*info mem*

should not give you access to the complete manual.

# LICENSE

Copyright © 2020 Kiëd Llaentenn

This utility is licensed under the MIT license.
