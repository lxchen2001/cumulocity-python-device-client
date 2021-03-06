#!/bin/bash

#get current directory as absolute path
MYDIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MYDIR" ]]; then MYDIR="$PWD"; fi
cd "$MYDIR"
MYDIR=`pwd`


echo "setup supervise for this application"
echo "app directory is $MYDIR"

apt-get -y install daemontools daemontools-run

APP_FOLDER="$MYDIR/supervise/"

update-service --add "$APP_FOLDER" cumulocity-client

#start supervise and application
svc -u "$APP_FOLDER"
