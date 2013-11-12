#!/bin/bash

set -x

if [ "$DEV_SERIAL" == "" ]; then
    DEV_SERIAL=$1
fi

if [ "$DEV_SERIAL" == "" ]; then
    echo missing DEV_SERIAL
    exit 1
fi

adb -s $DEV_SERIAL root
if [ "$1" == "clean" -o "$2" == 'clean' ]; then
    adb -s $DEV_SERIAL logcat -c > /dev/null
    adb -s $DEV_SERIAL shell dmesg -c > /dev/null
    adb -s $DEV_SERIAL shell rm /logs/aplog
    exit 1
fi


TIMESTAMP=`date +"%y%m%d_%H%M%S"`
HASHTAG=`echo $TIMESTAMP | md5sum`
HASHTAG=${HASHTAG:0:6}-$DEV_SERIAL-$TIMESTAMP

LOGDIR=~/logs/$HASHTAG
mkdir -p $LOGDIR

echo $TIMESTAMP > ${LOGDIR}/date
echo $DEV_SERIAL > ${LOGDIR}/serial

adb -s $DEV_SERIAL shell getprop > ${LOGDIR}/getprop

adb -s $DEV_SERIAL logcat -v time -d > $LOGDIR/logcat
adb -s $DEV_SERIAL shell dmesg > $LOGDIR/dmesg
adb -s $DEV_SERIAL pull /logs/history_event $LOGDIR

APLOGS=`adb shell ls /logs/aplog* | sed "s/\r//g"`
for apfile in $APLOGS
do
    adb -s $DEV_SERIAL pull $apfile $LOGDIR
done

if [ "$1" == "tar" -o "$2" == 'tar' ]; then
    tar czvf ~/logs/${HASHTAG}.tar.gz -C ~/logs/ ${HASHTAG}
fi
