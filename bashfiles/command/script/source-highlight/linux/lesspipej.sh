#!/bin/bash

ORIGINAL_LESSOPEN=/usr/share/source-highlight/src-hilite-lesspipe.sh
CONV_UTF8_COMMAND="/usr/bin/nkf -w"

conv_utf8() {
    $CONV_UTF8_COMMAND "$1"
}

if [ $# -eq 0 -o "$1" == "-" ] ; then # pipe
    conv_utf8 - 2> /dev/null
else                                  # file
    if [ -x $ORIGINAL_LESSOPEN -a `$ORIGINAL_LESSOPEN "$1" | head | wc -c` -gt 0 ] ; then
        $ORIGINAL_LESSOPEN "$1" | conv_utf8 - 2> /dev/null
    else
        conv_utf8 "$1" 2> /dev/null
    fi
fi
