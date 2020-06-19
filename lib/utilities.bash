#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

source $JOVER/lib/cecho.bash


# This function translate relative_path to absolute_path.
_translate-file-path() { # params: (relative_path:str, &absolute_path:str)
  local absolute_path=$2
  eval $absolute_path="$(readlink -f $1)"
}

