#!/bin/bash
HOME=$(readlink -f $(dirname $0))
WORK_DIR=`dirname $0`
sleep 1
nohup croc --pass 7758521 relay > /dev/null 2>&1 &
