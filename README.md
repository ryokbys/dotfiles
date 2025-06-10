# dotfiles
RK's personal dotfiles.

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

Install the dotfiles using _GNU stow_.
```shell
cd dotfiles
stow -v zsh emacs tmux gnuplot git
```
This will create symlinks in the home directory.
