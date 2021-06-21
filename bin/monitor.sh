#!/bin/bash
if [ "x$(uname)" == "xDarwin" ]; then
    ROOT_DIR=$(greadlink -f $(dirname $0))
else
    ROOT_DIR=$(readlink -f $(dirname $0))
fi
declare -i num
num=`ps -ef | grep ss-server | grep -v grep | wc -l`
if [ $num -eq 1 ]; then
    echo 'ss-server is running.'
else
    echo 'starting ss-server...'
    sh ${ROOT_DIR}/start_daemon.sh server
fi

