#!/usr/bin/env bash

###########################
# This script restores backed up dotfiles
###########################

# include my library helpers for colorized echo and require_brew, etc
source .lib/echos.sh

if [[ -z $1 ]]; then
  error "You need to specify a backup folder date. Take a look in ~/.dotfiles_backup/ to see which backup date you wish to restore."
  exit 1
fi

action "Restoring dotfiles from backup..."


for file in .*; do
  if [[ $file == "." || $file == ".." ]]; then
    continue
  fi

  running "~/$file"
  if [[ -e ~/$file ]]; then
      unlink ~/$file;
      echo -en "project dotfile $file unlinked";ok
  fi

  if [[ -e ./$file ]]; then
      mv ./$file ./
      echo -en "$1 backup restored";ok
  fi
  echo -en '\done';ok
done


green "All done."