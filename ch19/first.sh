#!/usr/bin/env bash
#
# a simple example of a common mistake
#
# set the value:
echo "=================="
echo "in first.sh"
export VAL=5
printf "VAL=%d\n" $VAL
# invoke our other script:
echo "=================="

#这种方法不能在另一个脚本中改变一个已经export的值
./second.sh

#但这种可以
#source ./second.sh

#这种也可以（但要echo 结果，并将second.sh中所有的输出重定向到 >&2 ）
# VAL=$(./second.sh)

#但不推荐以上三种方法，应该写成函数更合理

echo "=================="
echo "back to first.sh"
printf "VAL=%d\n" $VAL