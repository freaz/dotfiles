# dotfiles

## Installation

Cloning the dotfiles:

```shell
$ alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
$ home init
$ home remote add origin git@github.com:freaz/dotfiles.git
$ home fetch
$ home checkout master
```

Installing tools:

```shell
# all systems
$ make

# Mac OS X
$ make osx
```
