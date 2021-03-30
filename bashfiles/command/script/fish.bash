#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}
source ${SCRIPTDIR}/../common/common.bash

linux_command_install () {
    DESTRIBUTION=$(judge_os_distribution)
    case ${DISTRIBUTION} in
        debian* )
            BASE_VERSION=$(cat /etc/debian_version | awk '{print int($1)}')
            VERSION=${BASE_VERSION}
            if [ ${BASE_VERSION} -lt 10 ]; then
                VERSION=9.0
            fi

            echo "deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_${VERSION}/ /" \
                | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
            curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_${VERSION}/Release.key \
                | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
            sudo apt update
            sudo apt install fish
            ;;
        ubuntu* )
            sudo apt-add-repository ppa:fish-shell/release-3
            sudo apt-get update
            sudo apt-get install fish
            ;;
    esac
}


echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    darwin* )
        # mac
        brew install fish
        ;;
    linux* )
        linux_command_install
        ;;
esac

