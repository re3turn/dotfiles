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
        xonsh -c "xpip install prompt-toolkit \
                    pygments \
                    setproctitle \
                    gnureadline \
                    packaging"
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE:-0} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt-get install python3
        if !(type pipx > /dev/null 2>&1); then
          bash ${SCRIPTDIR}/pipx.bash
        fi
        pipx install --user xonsh \
                    prompt-toolkit \
                    pygments \
                    setproctitle \
                    gnureadline \
                    packaging
        ;;
esac
