# !/usr/bin/env bash
# Modified from the original: https://qiita.com/yutkat/items/c6c7584d9795799ee164

set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/dot.backup" ];then
    command echo "$HOME/dot.backup not found. Auto Make it"
    command mkdir "$HOME/dot.backup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      [[ `basename $f` == ".emacs.d" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/dot.backup"
      fi
      command ln -snf $f $HOME
    done
    #...Emacs prelude personal directory
    EMACSDIR=".emacs.d/personal"
    if [[ -L "$HOME/$EMACSDIR" ]]; then
        command rm -rf "$HOME/EMACSDIR"
    fi
    if [[ -e "$HOME/$EMACSDIR" ]]; then
        command mv "$HOME/$EMACSDIR" "$HOME/dot.backup/"
    fi
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
#git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"
