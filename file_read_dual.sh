#!/bin/sh

# 引数が2個の場合
if [  $# -eq 2 ] ; then
    # $1、$2のどちらかのファイルが存在しない場合
    if [  ! -e $1 ] || [ ! -e $2 ]; then
	echo "specify files not found"
	exit 1
    fi
else
    # 引数が2個でない場合はエラー
    echo "Usage: $0 file1.txt file2.txt"
    echo "specify 2 files"
    exit 1
fi

# 二つのファイルを異なるディスクリプタへ
exec 3< $1
exec 4< $2

# 二つのファイルを交互に読んで表示。
#ただしどちらかのファイルがEOFに達するとループは終了
while read aline <&3 && read bline <&4; do
	  echo $aline
	  echo $bline
done

exec 3<&-
exec 4<&-


    
