#!/usr/bin/env bash
# cookbook filename: use_up_option
#
# use and consume an option
# 如果带了选项-v，则不输出被修改的文件名
#
# 解析-v选项
VERBOSE=0;
if [[ $1 = -v ]]
then
    VERBOSE=1;
    # shift命令将$2 赋值为$1,将$3赋值为$2,...，然后$#的值减一
    shift;
fi
#
# the real work is here
#
for FN in "$@"
do
    if (( VERBOSE == 0 ))
    then
        echo changing "$FN"
    fi
    chmod 0750 "$FN"
done
