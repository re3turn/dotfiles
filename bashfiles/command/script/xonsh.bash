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
        brew install xonsh
        xonsh -c "xpip install prompt_toolkit \
                    Pygments \
                    ProcTitle \
                    gnureadline"
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE:-0} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt-get install python3 python3-pip
        pip3 install --user xonsh \
                    prompt_toolkit \
                    Pygments \
                    ProcTitle \
                    gnureadline
        ;;
esac
