#!/bin/bash
HOME=$(readlink -f $(dirname $0))
WORK_DIR=`dirname $0`
declare -i num
num=`ps -ef | grep croc | grep -v grep | wc -l`
if [ $num -eq 1 ]; then
    echo 'croc is running.'
else
    echo 'starting croc...'
    sh ${HOME}/start_share.sh
fi
