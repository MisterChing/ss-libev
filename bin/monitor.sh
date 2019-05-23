#!/bin/bash
HOME=$(readlink -f $(dirname $0))
WORK_DIR=`dirname $0`
declare -i num
num=`ps -ef | grep ss-server | grep -v grep | wc -l`
if [ $num -eq 1 ]; then
    echo 'ss-server is running.'
else
    echo 'starting ss-server...'
    sh ${HOME}/start_daemon.sh server
fi

