#!/usr/bin/env bash

git clone --bare git@github.com:bigfang/dotfiles.git "$HOME"/.dotfiles.git
dots() {
  git --git-dir="$HOME"/.dotfiles.git --work-tree="$HOME" "$@"
}
mkdir -p "$HOME"/.dots-backup
if [[ "$(dots checkout)" ]]; then
  echo "Checked out dot files.";
else
  echo "Backing up pre-existing dot files.";
  dots checkout 2>&1 | grep -E "^\s+" | awk '{$1=$1;print}' | xargs -I{} mv {} .dots-backup/
fi;
dots checkout
dots config status.showUntrackedFiles no
