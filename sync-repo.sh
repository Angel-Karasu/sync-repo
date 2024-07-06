#!/bin/sh

help() {
  echo "Usage : sync-repo [git_url_origin] [git_url_to_sync-1] ... [git_url_to_sync-n]";
}

path=/tmp/sync-git

if [ $# = 0 ]; then help;
else
  case "$1" in
    -h|--help)
      help;
      exit 0;
    ;;
  esac

  i=1;
  for url in "$@"; do
    git clone $url $path-$i;

    if [ $i -gt 1 ]; then
      cd $path-1/
      rm -rf ./.git;
      cp -r $path-$i/.git ./.git
      git commit -am "sync to $1"
      git push
    fi

    i=$(($i + 1))
  done
  rm -rf $path-*

  exit 0;
fi