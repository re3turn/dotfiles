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
        brew tap tkengo/highway
        brew install automake highway
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y automake google-perftools autoconf install build-essential
        git clone https://github.com/tkengo/highway.git ${SCRIPTDIR}/highway
        cd ${SCRIPTDIR}/highway
        ./tools/build.sh
        sudo make install
        cd ${SCRIPTDIR}
        rm -rf ${SCRIPTDIR}/highway
        ;;
esac
