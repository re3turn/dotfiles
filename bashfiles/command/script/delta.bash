#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}
source ${SCRIPTDIR}/../common/common.bash

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    darwin* )
        # mac
        brew install git-delta
        ;;
    linux* )
        # ubuntu
        if ! (type jq > /dev/null 2>&1); then
            bash ${SCRIPTDIR}/jq.bash
        fi
        github_release_install "https://api.github.com/repos/dandavison/delta/releases"
        ;;
esac

