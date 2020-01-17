git clone --bare git@github.com:bigfang/dotfiles.git $HOME/.dotfiles.git
function config {
   git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME $@
}
mkdir -p .dots-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out dot files.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

