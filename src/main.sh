#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

source $JOVER/lib/utilities.bash


_help="usage: mylinux <operation> [...]

operations:
    mylinux init    <options>
    mylinux install <options>
    mylinux load    <options>
    mylinux proxy   <options>
"

case $1 in
  init)
    source $JOVER/src/init.sh
    init ${@:2}
    ;;

  install)
    source $JOVER/src/install.sh
    install ${@:2}
    ;;

  load)
    source $JOVER/src/load.sh
    load ${@:2}
    ;;

  proxy)
    source $JOVER/src/proxy.sh
    proxy ${@:2}
    ;;

  -h|--help|'')
    information "$_help";
    ;;

  *)
    error "not found operate: \"$1\""
esac

