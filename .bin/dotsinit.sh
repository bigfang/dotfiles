#!/usr/bin/env bash

git clone --bare git@github.com:bigfang/dotfiles.git "$HOME"/.dotfiles.git
dot() {
  git --git-dir="$HOME"/.dotfiles.git --work-tree="$HOME" "$@"
}
mkdir -p "$HOME"/.dot-backup
if [[ "$(dot checkout)" ]]; then
  echo "Checked out dot files.";
else
  echo "Backing up pre-existing dot files.";
  dot checkout 2>&1 | grep -E "^\s+" | awk '{$1=$1;print}' | xargs -I{} mv {} .dot-backup/
fi;
dot checkout
dot config status.showUntrackedFiles no
