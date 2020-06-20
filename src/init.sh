#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

source $JOVER/lib/utilities.bash


base_packages=(yay unionfs-fuse)


_help="usage: mylinux init <operation>

operations:
    base            Install install base_packages (${base_packages[@]}).
    mirrors         Change mirrors to China. (sudo pacman-mirrors -i -c China -m rank)
"

_mirrors() {
  pacman-mirrors -i -c China -m rank
}

_base() {
  sudo pacman -S ${base_packages[@]}
}

init() {
  case $1 in
    'base')
      _base
      ;;

    'mirrors')
      _mirrors
      ;;

    -h|--help|'')
      information "$_help";
      ;;

    *)
      error "not found operate: \"$1\""
  esac
}

