# dotfiles

## Installation

On MacOS first install Xcode Command Line Tools:

```shell
$ xcode-select --install
```

On Debian or Ubuntu install build-essential:
```shell
$ sudo apt install build-essential
```

Cloning the dotfiles:

```shell
$ alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
$ home init
$ home remote add origin git@github.com:freaz/dotfiles.git
$ home fetch
$ home reset HEAD
```

Installing tools:

```shell
# For workstation (MacOS)
$ make station

# On server
$ make server
```

