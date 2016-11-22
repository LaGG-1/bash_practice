#!/bin/bash

if [ $# -lt 1 ]; then
    echo "specify read text flie"
    exit 1
fi

# while文で標準入力からファイルを読み込む
while read line
do
    echo $line
done < $1
