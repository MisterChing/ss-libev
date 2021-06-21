#!/bin/bash
if [ "x$(uname)" == "xDarwin" ]; then
    ROOT_DIR=$(greadlink -f $(dirname $0))
else
    ROOT_DIR=$(readlink -f $(dirname $0))
fi
sleep 1
if [ "$1"x == "server"x ]; then
    ${ROOT_DIR}/ss-server -c ${ROOT_DIR}/../conf/config.json -f ${ROOT_DIR}/../var/ss-server.pid
elif [ "$1"x == "client"x ]; then
    ${ROOT_DIR}/ss-local -c ${ROOT_DIR}/../conf/config.json -f ${ROOT_DIR}/../var/ss-local.pid
fi
