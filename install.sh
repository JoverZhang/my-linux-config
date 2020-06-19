#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/mylinux

# This is install file.
# Use git download project to ~/.mylinux

JOVER_VERSION='0.0.1-test.1'


git clone https://github.com/JoverZhang/mylinux.git $HOME/.mylinux

# Inject to user startup cycle.
mylinux_env="export JOVER=$HOME/.mylinux" # create env for project location.
bin_path="export PATH=$PATH:$HOME/bin" # add $HOME/bin to $PATH
mount_bin="mount -t unionfs -o dirs=$JOVER/bin unionfs $HOME/bin" # use unionfs mount bin

mkdir -p $HOME/bin

sed -i "s|$mylinux_env||" $HOME/.bashrc
sed -i "$ a $mylinux_env" $HOME/.bashrc

sed -i "s|$bin_path||" $HOME/.bashrc
sed -i "$ a $bin_path" $HOME/.bashrc

sed -i "s|$mount_bin||" $HOME/.bashrc
sed -i "$ a $mount_bin" $HOME/.bashrc

