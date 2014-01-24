#!/usr/bin/env bash
# cookbook filename: trackmatch
#
for CDTRACK in *
do
    # 使用=~来测试一个字符串是否复合 正则表达式
    if [[ "$CDTRACK" =~ "([[:alpha:][:blank:]]*)- ([[:digit:]]*) - (.*)$" ]]
    then
        echo Track ${BASH_REMATCH[2]} is ${BASH_REMATCH[3]}
		mv "$CDTRACK" "Track${BASH_REMATCH[2]}"
    fi
done
