dotfiles
========
User configuration files.


Sync usage
==========
> \# write from dotfiles to $HOME

`SRC_ROOT=~/src bash sync-dotfile.sh -e .vimrc`

> \# write from $HOME to dotfiles; full path this time

`SRC_ROOT=~/src bash sync-dotfile.sh -i ~/.vimrc`
