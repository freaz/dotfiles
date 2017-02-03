# dotfiles

## Installation

Cloning the dotfiles:

```shell
$ alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
$ home init
$ home remote add origin https://github.com/freaz/dotfiles
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

## Additional steps

Linking SublimeText configuration

```shell
$ rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
$ ln -s ~/.sublime_config ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```