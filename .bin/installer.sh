#!/usr/bin/env bash
#
helpmsg( ){
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir( ){
  command echo "backup old .dots..."
  if [ ! -d "$HOME/.dots_backup"] ; then
    command echo "$HOME/.dots_backup/ not found. Make It Automatically."
    command mkdir -p "$HOME/.dots_backup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local dotdir=$(readlink -f ${script_dir}/..)
  if [[ "$HOME" != "$dotdir" ]] ; then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]] ; then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]] ; then
        command mv -f "$HOME/`basename $f`" "$HOME/.dots_backup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ] ; doa
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
git config --global include.path "~/.gitconfig_shared"

command echo -e "\e[1;36m Install completed!!! \e[m"

