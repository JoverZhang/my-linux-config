#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

# base on proxychains.

proxychains_config='socks5 127.0.0.1 5505'
proxychains_file="/etc/proxychains.conf"

if [ "$1" = start ]
then
  sed -i '/^socket[4|5].*/d' $proxychains_file
  sed -i "$ a $proxychains_config" $proxychains_file
elif [ "$1" = stop ]
then
  sed -i "/$proxychains_config/d" $proxychains_file
fi

#sed 's/^socket[4|3]/#&/g' ./socket
