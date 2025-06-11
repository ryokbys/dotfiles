# dotfiles
RK's personal dotfiles.
Therefore it is not recommended to use this as is.

## Prerequisite

- zsh
  - oh-my-zsh
- emacs
  - prelude

## Install

Download the dotfiles onto your **home directory** (otherwise the following stow command option would be a bit more complex.).
```shell
git clone https://github.com/ryokbys/dotfiles.git ~/dotfiles
```

To install the dotfiles using _GNU stow_, run the following command at the dotfiles directory.
```shell
stow -v zsh emacs tmux gnuplot git
```
This will create symlinks in your home directory.
