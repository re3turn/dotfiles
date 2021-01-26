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
        MACHINE=$(judge_machine)
        DELTA_RELEASE=https://api.github.com/repos/dandavison/delta/releases
        DEB_URL=$(curl -s ${DELTA_RELEASE} | jq -r ".[0].assets[] | select(.name | test(\"${MACHINE}.deb\")) | .browser_download_url" | head -n 1)
        mkdir -p ${SCRIPTDIR}/delta
        wget -qO ${SCRIPTDIR}/delta/delta.deb $DEB_URL
        sudo dpkg -i ${SCRIPTDIR}/delta/delta.deb
        rm -rf ${SCRIPTDIR}/delta
        ;;
esac

