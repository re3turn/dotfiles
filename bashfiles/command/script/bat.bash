#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}
source ${SCRIPTDIR}/../common/common.bash

if (type batcat > /dev/null 2>&1); then
    exit
fi

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    darwin* )
        # mac
        brew install ${CMD} 
        ;;
    linux* )
        # ubuntu
        DISTRIBUTION=$(judge_os_distribution)
        if [ "${DISTRIBUTION}" = "ubuntu" ]; then
            test ${APT_UPDATE:-0} -eq 0 && APT_UPDATE=1; sudo apt update
            sudo apt install -y ${CMD}
        else
            github_release_install "https://api.github.com/repos/sharkdp/bat/releases"
        fi
        ;;
esac

if (type batcat > /dev/null 2>&1); then
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi

