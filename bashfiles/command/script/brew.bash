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
    linux* )
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y build-essential procps curl file git
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
esac
