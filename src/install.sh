#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config


package_manager='yay'
package_manager_args='-S'

# install packages.aur
packages=$(awk '!/^#.*/{print}' $JOVER/etc/packages.aurepo)
$package_manager $package_manager_args ${packages[@]}

