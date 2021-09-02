#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    linux* )
        # ubuntu
        if (uname -r | grep WSL > /dev/null 2>&1); then
            sudo ln -fs /mnt/c/Users/${USER}/scoop/shims/win32yank.exe /usr/local/bin/win32yank.exe
            sudo ln -fs /usr/local/bin/win32yank.exe /usr/local/bin/win32yank
        fi
        ;;
esac

