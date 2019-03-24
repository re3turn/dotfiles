
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
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ;;
esac
