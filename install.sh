#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/mylinux

# This is install file.
# Use git download project to ~/.mylinux

git clone https://github.com/JoverZhang/mylinux.git ~/.mylinux

mylinux_env="export JOVER=$HOME/.mylinux"

sed -i "/$mylinux_env/d" ~/.bashrc
sed -i "$ a $mylinux_env" ~/.bashrc

