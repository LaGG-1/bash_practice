#!/bin/bash

if [ $# -lt 1 ]; then
    echo "specfiy text file name"
    exit 1
fi

# doneでファイルディスクリプタ番号3にファイルを読み込ませる

# read に3番のファイルディスクリプタから読み込ませる
while read line <&3; do
    echo $line
# 第1引数で指定したファイルをファイルディスクリプタ3から読み込ませる
done 3< $1
