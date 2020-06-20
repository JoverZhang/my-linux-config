#!/bin/bash
# author: Jover Zhang <joverzh@gmail.com>
# url: https://www.github.com/JoverZhang/my-linux-config

source $JOVER/lib/utilities.bash


_help="usage: mylinux load <operation>

operations:
    override        Override config_files in $HOME/[files] from $JOVER/etc/home/[files],
    special         To 'special' content into $HOME/[files],
                    for file of first line is #!SPECIAL.
    -a --all        Do override and special.
"

STORE=$JOVER/etc/home


create-dependent-directories() { # params: (directory_list: arr<str>)
  directory_list=("$@")
  for i in ${directory_list[@]}
  do
    mkdir -p $HOME/$i
  done
}

_get-content() { # params: (file_name: str, decorator: str) -> content: str
  echo "$(awk -v decorator="$2" '$1 == decorator {$1=""; print $0}' $1)"
}

special-to-home() { # params: (path_list: arr<str>)
  path_list=("$@")
  for i in ${path_list[@]}
  do
    append_content=$(_get-content $STORE/$i '@APPEND')
    if [[ $append_content ]]; then
      content_line=$(echo "$append_content" | wc -l)

      sed -i '$ a #Jover_special' $HOME/$i
      for j in $(seq 1 $content_line); do
        aline=$(echo "$append_content" | sed -n $j'p')
        sed -i "$ a $aline" $HOME/$i
      done
      sed -i '$ a #special_end' $HOME/$i
    fi
    # replace_content=$(_get-content $STORE/$i '@REPLACE')
  done
}

override-to-home() { # params: (path_list: arr<str>)
  path_list=("$@")
  for i in ${path_list[@]}
  do
     cp -i $STORE/$i $HOME/$i
  done
}


dependent_directory_list=()
special_file_list=()
override_file_list=()

for i in $(find $STORE | awk -F '/etc/home/' '!!$2 {print $2}')
do
  if [[ -d $STORE/$i ]]; then # acquire directories.
    dependent_directory_list+=($i)
    continue
  fi

  if [[ $(sed -n '/^#!SPECIAL/p' $STORE/$i) ]]; then
    special_file_list+=($i)
  else
    override_file_list+=($i)
  fi
done

special() {
  special-to-home ${special_file_list[@]}
}

override() {
  create-dependent-directories ${dependent_directory_list[@]}
  override-to-home ${override_file_list[@]}
}

load() { # params: (operator:str, ...args)
  case $1 in
    'override')
      override $@
      ;;
  
    'special')
      special $@
      ;;
  
    -a|--all)
      echo do all...
      echo override
      override $@
      echo special
      special $@
      ;;

    -h|--help|'')
      information "$_help";
      ;;

    *)
      error "not found operate: \"$1\""
  esac
}

