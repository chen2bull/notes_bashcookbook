#!/usr/bin/env bash
# cookbook filename: onebyone
#
# 一个接一个地处理字符

while read ALINE
do
    # ${#ALINE} 获得${ALINE}的字符个数
    for ((i=0; i < ${#ALINE}; i++))
    do
	#从ALINE的第i个字母开始取,每次取1个字母
        ACHAR=${ALINE:i:1}
        # do something here, e.g. echo $ACHAR
	echo $ACHAR
    done
done
