#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

source $JOVER/lib/utilities.bash


manual="usage: jover <operation> [...]

operations:
  init:
    Change mirrors to China. (sudo pacman-mirrors -i -c China -m rank)
    Install install base_packages (yay, unionfs-fuse).

  install:
    [file]: Install packages by .aurepo file. Default use $JOVER/etc/packages.aurepo file.

  load:
    override:
      Override config_files in $HOME/ from /etc/own .
     If #APPEND_TO_FILE is first line from file,
     then this file will not overrided old_file from $HOME,
    special:
      To 'special' content into old_file.
      In other cases, 

  proxy:
    start: open local proxychains.
    stop: close local proxychains.
"

case $1 in
  init)
    source $JOVER/src/init.sh
    ;;

  load)
    source $JOVER/src/load.sh
    load ${@:2}
    ;;

  proxy)
    source $JOVER/src/proxy.sh ${@:2}
    ;;

  install)
    source $JOVER/src/install.sh ${@:2}
    ;;

  -h|--help|'')
    information "$manual";
    ;;

  *)
    error "not found operate: \"$1\""
esac

