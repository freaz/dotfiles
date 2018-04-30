# dotfiles

## Installation

On OS X first install Xcode Command Line Tools:

```shell
$ xcode-select --install
```

Cloning the dotfiles:

```shell
$ alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
$ home init
$ home remote add origin git@github.com:freaz/dotfiles.git
$ home fetch
```

Installing tools:

```shell
# all systems
$ make

# Mac OS X
$ make osx
```

### Sublime

On first time use `Sublime Package Control` must be installed.

Press `CMD + SHIFT + P`, type `Install Package Control` and confirm by pressing `Enter`.