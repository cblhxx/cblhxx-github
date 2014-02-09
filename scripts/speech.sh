#!/bin/bash
say_us() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&q=$*"; }
say_uk() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.co.uk/translate_tts?tl=en&q=$*"; }
say_al() { say_us $*; say_uk $*; }

SAY=say_us

if [ "$1" == "_uk" ]; then
    shift
    SAY=say_uk
fi

if [ "$1" == "_al" ]; then
    shift
    SAY=say_al
fi


if [ "$#" != 0 ]; then
    echo $*
    sleep 1
    $SAY $* > /dev/null 2>&1
    exit 0
fi

IDX=1
while read WORD;
do
    echo $IDX $WORD
    IDX=`expr $IDX + 1`
    sleep 1
    $SAY $WORD > /dev/null 2>&1
done
