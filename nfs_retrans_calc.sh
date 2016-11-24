#!/bin/bash

# mount -t nfsのtimeoオプションはRPCタイムアウト後の再送までの時間。単位は1=0.1秒。デフォルトは7(0.7秒)
# retransはRPCタイムアウト後の再送の回数。これを越えるとメジャータイムアウト。
# timeoの時間は回数を重ねると次は再送時間を倍にする。例えばtimeo=10であれば一度目は1秒、次は2秒、その次は4秒、8秒と増加していく。これが60秒を越えるとメジャータイムアウトとなる。
# retryはマウントオペレーションにおけるリトライを放棄するまでの時間。デフォルトは1000分


# [課題] retransの回数を越えるかタイムアウトが60秒を越えるとメジャータイムアウトとなり"server not responding"のメッセージが表示される。最初に与えられたtimeo値からタイムアウトが60秒になるまでの最大のretansの回数を計算せよ

# 標準入力からタイムアウト値を入力
echo -n "input timeo value : "
read timeov

# 入力値が数字かチェック
#if ! expr "$timeov" : '[0-9]*' > /dev/null;  then
# 正規表現 [[ 文字列 =~ 正規表現 ]]で文字のチェック
# [0-9]+$
if [[ "$timeov" =~  [0-9]+$ ]];  then
    :
else
    
    echo "数値を入力してください"
    exit 1
fi
# タイムアウト最大値は60秒
max_timeo=600

# retransの初期値は1
retrans=1

# タイムアウト合計値
ttime=0

until [ $timeov -ge $max_timeo ]; do
    
    # マイナータイムアウトの時間表示
    echo "wait time $retrans : $timeov"
    # タイムアウトの合計時間の表示
    ttime=`expr $ttime + $timeov`
    # 次回のタイムアウト値とretrans値
    timeov=`expr $timeov \* 2`
    retrans=`expr $retrans + 1`

done

echo "max retrans:  $retrans times, total time out: $ttime + 600"




