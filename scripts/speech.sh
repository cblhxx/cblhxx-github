#!/bin/bash
#set -x
say_us() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&q=$*"; }
say_uk() { local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.co.uk/translate_tts?tl=en&q=$*"; }
if [ "$1" == "_uk" ]; then
    shift
    say_uk $* > /dev/null 2>&1
    echo $*
    exit 0
fi

if [ "$1" == "_al" ]; then
    shift
    say_us $* > /dev/null 2>&1
    say_uk $* > /dev/null 2>&1
    echo $*
    exit 0
fi

say_us $* > /dev/null 2>&1
echo $*
