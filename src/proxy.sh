#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

# base on proxychains.

source $JOVER/lib/utilities.bash


_help="usage: mylinux proxy <operation>

operations:
    start           open local proxychains.
    stop            close local proxychains.
"

proxychains_config='socks5 127.0.0.1 5505'
proxychains_file="/etc/proxychains.conf"


_start() {
  sed -i '/^socket[4|5].*/d' $proxychains_file
  sed -i "$ a $proxychains_config" $proxychains_file
}

_stop() {
  sed -i "/$proxychains_config/d" $proxychains_file
}

proxy() {
  case $1 in
    'start')
      _start
      ;;

    'stop')
      _stop
      ;;

    -h|--help|'')
      information "$_help";
      ;;

    *)
      error "not found operate: \"$1\""
  esac
}

