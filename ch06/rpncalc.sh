#!/usr/bin/env bash
# cookbook filename: rpncalc
#
# simple RPN command line (integer) calculator
#
# takes the arguments and computes with them
# of the form a b op
# allow the use of x instead of *
#
# error check our argument counts:
echo $#

if [ \( $# -lt 3 \) -o  \( $(( $# % 2 )) -eq 0 \) ]
then
    # 合法的输入是 ./rpcalc.sh 3 4 '*'
    # ./rpcalc.sh 3 4 '*' 5 + 6 -
    echo "usage: calc number number op  [ number op ] ..."
    # 命令行中输入 * 会自动匹配当前目录下所有的文件
    # 所以命令行中需要输入 ’*‘ 
    echo "use x or '*' for multiplication"
    exit 1
fi

ANS=$(($1 ${3//x/*} $2))
shift 3
while [ $# -gt 0 ]
do
    ANS=$((ANS ${2//x/*} $1))
    shift 2
done
echo $ANS
