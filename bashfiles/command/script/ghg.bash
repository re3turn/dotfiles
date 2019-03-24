#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

go get github.com/Songmu/ghg/cmd/ghg
mkdir -p $(ghg bin)
