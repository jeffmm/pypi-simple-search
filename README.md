# PyPi Simple Search

A stop-gap replacement for `pip search`

## What?

There are two scripts here, `pypi-simple-search` and `pip-pss`. The former is a script that replaces part of the functionality of `pip search` by infrequently caching the list of packages from [PyPi Simple Index](https://pypi.org/simple/) locally, and then searching the cache when called, resulting in a list of matching package names---no descriptions (yet). The latter is a wrapper for `pip` that calls `pypi-simple-search` when passed the `search` subcommand, and can be used in an alias to replace `pip`.

## Why?

The functionality of `pip search` has been deprecated for reasons described [here](https://github.com/pypa/pip/issues/5216). Since a package manager should have a way to search the package repository, I wrote this script for my own use and decided to share it.

## Installation

The executables are just bash scripts that can be copied somewhere in your `$PATH`. You can also do

```bash
make install
```

to copy the scripts to `/usr/local/bin`. There is also

```bash
make uninstall
```

that will remove the executables.

## Usage

Once the executables are in your `$PATH`, you can use the search functionality by calling

```bash
pypi-simple-search [OPTIONS] [ARGS]
```

When executed, the script will search a local cache of the contents of the [PyPi Simple Index](https://pypi.org/simple/) and return packages that match the arguments.

The options available are

```bash
-h     Show the help menu
-u     Update the local PyPi package cache
```

The update will happen automatically when the script is first called, and also when the cache is more than a week old.

The command used to search the cache defaults to `grep`, but may be customized by setting the `$PYPI_SIMPLE_SEARCH` environment variable to e.g. `"rg"` or `"ag"` or `"grep -E"`, etc.

The wrapper script can be used as a replacement for `pip` by calling

```bash
pip-pss search foo
```

This is equivalent to

```bash
pypi-simple-search foo
```

If `search` is not the subcommand passed, e.g.

```bash
pip-pss install foo
```

this will be equivalent to

```bash
pip install foo
```

It's easiest to just add an alias to your `~/.bash_aliases`

```bash
alias pip="pip-pss"
```

so you can rely on muscle memory whenever you need to know how to properly spell a package name (at least until a more sustainable solution arrives).

## Contributing

If my implementation can be improved or if you find a bug, feel free to raise it as an issue or submit a pull request.
