# dotfiles
RK's personal dotfiles.

## Prerequisite

- zsh
  - oh-my-zsh
- emacs
  - prelude

## Install

Download the dotfiles onto the home directory.
```shell
git clone https://github.com/ryokbys/dotfiles.git ~/dotfiles
```

Install the dotfiles using _GNU stow_.
```shell
cd dotfiles
stow -v zsh emacs tmux gnuplot git
```
