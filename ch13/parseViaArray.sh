#!/usr/bin/env bash
# cookbook filename: parseViaArray
# 功能:查出指定文件的大小
# 

# use an array to parse the ls -l output into words
LSL=$(ls -ld $1)

# 声明MYRA是一个数组
declare -a MYRA
MYRA=($LSL)

# ${MYRA[0]}表示第一个元素
echo the file $1 is ${MYRA[4]} bytes.