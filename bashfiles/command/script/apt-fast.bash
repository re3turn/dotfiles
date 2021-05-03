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
            /bin/bash -c "$(curl -sL https://git.io/vokNn)"
            ;;
        ubuntu* )
            sudo add-apt-repository ppa:apt-fast/stable
            sudo apt update
            sudo apt install -y apt-fast
            ;;
    esac
}


case ${OSTYPE} in
    linux* )
        if (type /usr/sbin/${CMD} > /dev/null 2>&1); then
            exit
        fi
        if (type /usr/local/sbin/${CMD} > /dev/null 2>&1); then
            exit
        fi
        echo "#########################################"
        echo "# Install ${CMD}"
        echo "#########################################"
        linux_command_install
        ;;
esac

