#!/usr/bin/env bash

cmd=bash
bashPath=/bin/bash
num=$1
if [[ ! -f ${bashPath} ]]; then
    cmd=sh
fi

if [[ ! "$1" ]]; then
    num=1;
fi
containerId=$(docker ps|grep -v grep |grep -v CONTAINER|awk 'NR=='${num}'{print $1}')
docker exec -it ${containerId}  ls -l /bin/bash 2>&1 >/dev/null


if [[ ${?} == 1 ]]; then
    cmd=sh
fi
docker exec -it ${containerId} ${cmd}