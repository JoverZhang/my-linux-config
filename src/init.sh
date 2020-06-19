#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

base_pakages=(yay unionfs-fuse)
#pacman-mirrors -i -c China -m rank
sudo pacman -S ${base_pakages[@]}
