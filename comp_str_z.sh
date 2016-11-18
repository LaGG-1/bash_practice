#!/bin/bash

if [ -z $1 ]; then # -z は文字列$1の長さ=0の場合真

    echo "no specify filename"

elif [  -n  $1 ] ; then # -n 文字列$1の長さ>0の場合真
    
     if [ -e $1 ]; then #-e 文字列$1に一致するファイルが存在の場合真
	 echo "file $1 is exist"
     else
	 echo "specify file not found"
     fi
     
fi
