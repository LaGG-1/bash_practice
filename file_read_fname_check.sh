#!/bin/bash

if [ $# -lt 1 ]; then
    echo "specify test file"
    exit 1
fi

# あらかじめexecでファイルを開く
exec 3< $1

# execの結果チェック
if [  $? -ne 0 ]; then
    exit 1
fi

while read line <&3; do
    echo $line
done

# ファイルディスクリプタを閉じる
exec 3<&-

#この場合9行目でexecのエラーメッセージが標準出力に表示される。
