#!/bin/sh

cd `realpath $(dirname $0)` || exit 1

echo `realpath $(dirname $0)`

sudo chmod +x ./*.sh

echo "Add sync-repo command"
sudo cp ./sync-repo.sh /usr/local/bin/sync-repo

printf "\nWould you want to remove the installation folder ? [Y/n] "; read -r
[ "`echo $REPLY | tr N n | cut -c1`" = n ] || sudo rm -rf `realpath $(dirname $0)`

echo; echo "Success to install sync-repo, you must have git installed"
exit 0