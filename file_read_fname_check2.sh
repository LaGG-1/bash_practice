#!/bin/bash

# 引数$1をtest -zでチェック
if [ ! -z $1 ]; then
    # $1が存在するかtest -eでチェック
    if [ ! -e $1 ]; then
	   echo "$1 is not found"
	   exit 1
    fi
else
    echo "specify test file"
    exit 1
fi

exec 3< $1

while read line <&3; do
    echo $line
done

exec 3<&-
