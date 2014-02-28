#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=`pwd`                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc oh-my-zsh tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
if [ -d "$olddir" ]; then #but if it already exist do not overwrite
    echo "Error: backup directory '$olddir' already exists"
    echo "Rename or remove and then re-run script"
    exit
fi

echo -n "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    echo ~/.$file "->" $olddir/
    mv -f ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
    echo
done

