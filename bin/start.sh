#!/bin/bash
HOME=$(readlink -f $(dirname $0))
WORK_DIR=`dirname $0`
sleep 1
if [ "$1"x == "server"x ]; then
    ${HOME}/ss-server -c ${HOME}/../conf/config.json -f ${HOME}/../var/ss-server.pid
elif [ "$1"x == "client"x ]; then
    ${HOME}/ss-local -c ${HOME}/../conf/config.json -f ${HOME}/../var/ss-local.pid
fi
