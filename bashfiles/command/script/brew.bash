#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}
source ${SCRIPTDIR}/../common/common.bash

case ${OSTYPE} in
    darwin* )
        # mac
        echo "#########################################"
        echo "# Install ${CMD}"
        echo "#########################################"
        xcode-select --install
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        MACHINE=$(judge_machine)
        if [ "${MACHINE}" = "arm64" ]; then
            export HOMEBREW_PREFIX="/opt/homebrew"
            export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
            export HOMEBREW_REPOSITORY="/opt/homebrew"”;
            export HOMEBREW_SHELLENV_PREFIX="/opt/homebre";
            export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
            export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}";
            export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
        fi

        echo "#########################################"
        echo "# Install GNU command"
        echo "#########################################"
        brew install binutils \
                     findutils \
                     diffutils \
                     coreutils \
                     moreutils \
                     gnu-tar \
                     gnu-sed \
                     gnu-time \
                     gnu-getopt \
                     grep \
                     gawk \
                     gzip
        ;;
esac
