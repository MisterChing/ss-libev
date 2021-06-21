#!/bin/bash
HOME=$(readlink -f $(dirname $0))
WORK_DIR=`dirname $0`
declare -i num
declare -i num2
num=`ps -ef | grep ss-local | grep -v grep | wc -l`
num2=`ps -ef | grep goproxy | grep -v grep | wc -l`
if [ $num -eq 1 ]; then
    echo 'ss-local is running.'
else
    echo 'starting ss-local...'
    ${HOME}/ss-local -c ${HOME}/../conf/config.json > /dev/null 2>&1 &
fi
if [ $num2 -eq 1 ]; then
    echo 'goproxy is running.'
else
    echo 'starting goproxy...'
    ${HOME}/../goproxy/proxy sps -S socks -T tcp -P 127.0.0.1:1080 -t tcp -p 127.0.0.1:11080 > /dev/null 2>&1 &
    echo 'export http_proxy=http://127.0.0.1:11080;export https_proxy=http://127.0.0.1:11080;'

fi


