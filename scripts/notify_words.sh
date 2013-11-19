#!/bin/bash


if [ ! -f "$1" ]; then
    echo must specify a file
    exit 1
fi

while [ 1 ] ; do
    WORDCOUNT=`cat $1 | wc -l`
    RANDLINE=`expr $RANDOM % $WORDCOUNT + 1`
    WORD=`sed -n "$RANDLINE"p $1`
    notify-send $WORD
    sleep 60
done
