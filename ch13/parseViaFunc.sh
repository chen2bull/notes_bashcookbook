#!/usr/bin/env bash
# cookbook filename: parseViaFunc
#
# 用函数调用解析 ls -l的输出
# an example of output from ls -l follows:
# -rw-r--r--  1 albing users 126 2006-10-10 22:50 fnsize
#-rwxr-xr-x 1 cmj cmj  452 10月 20 19:23 parseViaFunc.sh

function lsparts ()
{
    PERMS=$1
    LCOUNT=$2
    OWNER=$3
    GROUP=$4
    SIZE=$5
    CRDATE="${6} ${7}" 
    CRTIME=$8
    FILE=$9
    
}

lsparts $(ls -l "$1")

echo $FILE has $LCOUNT 'link(s)' and is $SIZE bytes long.

echo create date: "$CRDATE"
echo create time: "$CRTIME"
