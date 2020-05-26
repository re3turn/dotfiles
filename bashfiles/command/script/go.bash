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
        brew install go
        ;;
    linux* )
        # ubuntu
        VERSION_ID=$(cat /etc/os-release | grep VERSION_ID |  awk '$0 = substr($0, 13, 5)' | tr -d ".")
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        if [ ${VERSION_ID} -lt 2004 ]; then
            sudo apt install -y software-properties-common
            sudo add-apt-repository -y ppa:longsleep/golang-backports
        fi
        sudo apt update
        sudo apt install -y golang-go
        ;;
esac

# GOPATH
mkdir -p ~/.go
