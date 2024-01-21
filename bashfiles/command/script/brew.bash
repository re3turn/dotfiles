#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

case ${OSTYPE} in
    darwin* )
        # mac
        echo "#########################################"
        echo "# Install ${CMD}"
        echo "#########################################"
        xcode-select --install
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
