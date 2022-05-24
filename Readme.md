# pwdh
[![Haskell CI](https://github.com/ghsable/pwdh/actions/workflows/haskell.yml/badge.svg)](https://github.com/ghsable/pwdh/actions/workflows/haskell.yml)

pwdh is pwd written by [Haskell](https://www.haskell.org/).

## Installation
```console
$ cabal install pwdh-0.1.0.0
```

## Usage
```console
$ pwdh --help
Print the full filename of the current working directory.

-P, --physical  avoid all symlinks

    --help      display this help and exit

    --version   output version information and exit

If no option is specified, -P is assumed.
```

## Example
```console
[user@host:/home]$ pwdh -P
/home
```

## License
[BSD-3-Clause](https://spdx.org/licenses/BSD-3-Clause.html)
