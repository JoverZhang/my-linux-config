#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/mylinux

# This is install file.
# Use git download project to ~/.mylinux

JOVER_VERSION='0.0.1-test.1'


git clone https://github.com/JoverZhang/mylinux.git $HOME/.mylinux

mylinux_env="export JOVER=$HOME/.mylinux"

sed -i "s|$mylinux_env||" $HOME/.bashrc
sed -i "$ a $mylinux_env" $HOME/.bashrc

