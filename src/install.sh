#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

source $JOVER/lib/utilities.bash


_help="usage: mylinux install <operation>

operations:
    download        Download packages, use $JOVER/etc/packages.aurepo file.
    install         Install packages, use $JOVER/etc/packages.aurepo file.
"


package_manager='yay'

packages=$(awk '!/^#.*/{print}' $JOVER/etc/packages.aurepo)

_install() {
  $package_manager -S ${packages[@]}
}

_download() {
  $package_manager -S --downloadonly ${packages[@]}
}

install() {
  case $1 in
    'install')
      _install
      ;;

    'download')
      _download
      ;;

    -h|--help|'')
      information "$_help";
      ;;

    *)
      error "not found operate: \"$1\""
  esac
}

