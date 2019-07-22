#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
export APT_UPDATE=0

install_command()
{
    while [ $# -gt 0 ] ; do
        CMD=$1
        shift
        if (type ${CMD} > /dev/null 2>&1); then
            continue
        fi

        bash ${SCRIPTDIR}/script/${CMD}.bash
    done
}

install_command brew \
                git \
                nvim \
                hw \
                fzf \
                fish \
                go \
                ghg \
                ghq

unset APT_UPDATE
