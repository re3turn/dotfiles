#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}
source ${SCRIPTDIR}/../common/common.bash

linux_command_install () {
    DISTRIBUTION=$(judge_os_distribution)
    case ${DISTRIBUTION} in
        debian* )
            ;;
        ubuntu* )
            sudo add-apt-repository -y ppa:neovim-ppa/unstable
            ;;
    esac

    sudo apt update
    sudo apt install -y software-properties-common \
                        neovim \
                        python3-neovim python3-pip \
                        xclip xsel
    pip3 install --user pynvim
}

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    darwin* )
        # mac
        brew install python neovim
        pip3 install --user pynvim
        ;;
    linux* )
        linux_command_install
        ;;
esac

