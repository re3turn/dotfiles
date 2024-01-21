#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    darwin* )
        # mac
        brew install pyenv
        mkdir -p ${HOME}/.pyenv
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE:-0} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y libbz2-dev libreadline-dev libssl-dev libsqlite3-dev libffi-dev
        git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv
        git clone https://github.com/yyuu/pyenv-update.git ${HOME}/.pyenv/plugins/pyenv-update
        ;;
esac

