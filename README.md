Inspiration for this taken from DistroTube (Derek Taylor)

https://www.atlassian.com/git/tutorials/dotfiles

```
git clone --bare https://github.com/kar0v/dotfiles.git $HOME/.cfg
function conf {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
conf checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
conf checkout
conf config status.showUntrackedFiles no
```
