#!/bin/bash
if [ "x$(uname)" == "xDarwin" ]; then
    ROOT_DIR=$(greadlink -f $(dirname $0))
else
    ROOT_DIR=$(readlink -f $(dirname $0))
fi
declare -i num
declare -i num2
num=`ps -ef | grep ss-local | grep -v grep | wc -l`
num2=`ps -ef | grep goproxy | grep -v grep | wc -l`
if [ $num -eq 1 ]; then
    echo 'ss-local is running.'
else
    echo 'starting ss-local...'
    ${ROOT_DIR}/ss-local -c ${ROOT_DIR}/../conf/config.json > /dev/null 2>&1 &
fi
if [ $num2 -eq 1 ]; then
    echo 'goproxy is running.'
else
    echo 'starting goproxy...'
    ${ROOT_DIR}/../goproxy/proxy sps -S socks -T tcp -P 127.0.0.1:1080 -t tcp -p 127.0.0.1:11080 > /dev/null 2>&1 &
fi
export http_proxy=http://127.0.0.1:11080;export https_proxy=http://127.0.0.1:11080;
echo 'export http_proxy=http://127.0.0.1:11080;export https_proxy=http://127.0.0.1:11080;'

