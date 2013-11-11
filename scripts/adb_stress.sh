#!/bin/bash

# set -x

DEV_SERIAL=$1
IN_FOLDER=$2
OUT_FOLDER=$3


if [ $# -lt 3 ]; then
    echo "adb push/pull stress test;";
    echo "    It will push and pull the entire folder and every single file in it to DUT continu continuously.";
    echo ""
    echo "./adb_stress.sh RHBEC245400105 ./libmtp/ /data/adb_stress33"
    echo "arg1: deviceSN";
    echo "arg2: local folder which your files stored in.";
    echo "arg3: folder in DUT which you want to store your files."
    exit -1
fi

dos2unix --version;
if [ $? != 0 ]; then
    echo please install dos2unix first;
    exit -1
fi


FILELIST=filelist_${DEV_SERIAL}_`basename ${IN_FOLDER}`_`basename ${OUT_FOLDER}`

while [ 1 ]
do
    adb -s $DEV_SERIAL shell mkdir $OUT_FOLDER

    echo "Start pushing folder to DUT"
    # push entire folder to DUT
    adb -s $DEV_SERIAL push $IN_FOLDER $OUT_FOLDER
    if [ $? != 0 ]; then
	exit -1;
    fi

    if [ `expr $RANDOM % 2` == 1 ]; then
	adb -s $DEV_SERIAL shell rm -rf $OUT_FOLDER
	adb -s $DEV_SERIAL shell mkdir $OUT_FOLDER
    fi

    echo "Start pushing files to DUT"
    # find all files in local folder and push each one to DUT
    find $IN_FOLDER -type f> $FILELIST
    while read filename
    do
	echo push $filename
	adb -s $DEV_SERIAL push "$filename" $OUT_FOLDER
	if [ $? != 0 ]; then
	    exit -1;
	fi
    done < ./$FILELIST
    sleep `expr $RANDOM % 10`


    echo "Start pulling files from DUT"
    # find all files in specified folder on DUT and pull each one
    adb -s $DEV_SERIAL shell find $OUT_FOLDER -type f > $FILELIST
    while read filename
    do
	aaa=`echo $filename | dos2unix`
	echo pull $aaa
	adb -s $DEV_SERIAL pull "${aaa}" ./pull/
	if [ $? != 0 ]; then
	    exit -1;
	fi
    done < ./$FILELIST
    sleep `expr $RANDOM % 10`


    echo "Start pulling folder from DUT"
    # pull the specified folder
    adb -s $DEV_SERIAL pull $OUT_FOLDER ./pull/
    if [ $? != 0 ]; then
        exit -1;
    fi

    sleep `expr $RANDOM % 30`


    if [ `expr $RANDOM % 2` == 1 ]; then
	adb -s $DEV_SERIAL shell rm -rf $OUT_FOLDER
    fi
done
