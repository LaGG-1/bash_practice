#!/bin/bash

echo -n "input value for sqrt: "
read sqrtval

# 平方根を求める関数sqrtは"sqrt (16)"とカッコで数値を囲ってbcに渡す
# bcを-lを付けて起動すると数学ライブラリが読み込まれscale(小数点以下の桁数)が20に設定される。
if [[ "$sqrtval"  =~  [0-9]+$ ]]; then
    sqrtresult=`echo "sqrt ($sqrtval)"  | bc -l`
    echo "$sqrtresult"
else
    echo "数値を入力してください"
fi

echo -n "input add number #1: "
read addval1
echo -n "input add number #2: "
read addval2

# たし算は echo "1 + 2"  |  bc とパイプでbcに引数として演算を与える
if [[ "$addval1" =~ [0-9]+$ ]]  && [[ "$addval2" =~ [0-9]+$ ]]; then
    addresult=`echo "$addval1" + "$addval2" | bc`
    echo "$addval1 + $addval2 = $addresult"
else
    echo "数値を入力してください"
fi

# 計算記号
# ++ インクリメント
# -- デクリメント
# 数値1 /  数値2   割り算
# 数値1 % 数値2    数値1÷数値2の余り
# 数値1 ^ 数値2    数値1を「数値2」乗
# length=桁     有効桁数指定
# s (数値)       sin
# c (数値)       cos
# a (数値)       atan
# scale=桁      小数点以下の桁数指定。初期値は0

echo -n "input value for sin: "
read sinval
echo -n "input value for scale: "
read scaleval

if [[ "$sinval" =~ [0-9]+$ ]] && [[ "$scaleval" =~ [0-9]+$ ]]; then
    sinresult=`echo "scale=$scaleval; s ($sinval)"  | bc -l`
    cosresult=`echo "scale=$scaleval; c ($sinval)"  | bc -l`
    echo "sin $sinval = $sinresult, cos $sinval = $cosresult"
else
    echo "数値を入力してください"
fi
