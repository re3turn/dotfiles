#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
export APT_UPDATE=0

for SCRIPT_PATH in $(find ${SCRIPTDIR}/script -maxdepth 1 -type f); do
    SCRIPT_NAME=$(basename ${SCRIPT_PATH})
    if (type ${SCRIPT_NAME%.*} > /dev/null 2>&1); then
        continue
    fi

    bash ${SCRIPT_PATH}
done

unset APT_UPDATE

