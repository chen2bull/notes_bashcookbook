#!/usr/bin/env bash
# cookbook filename: hard_to_kill
# 这是一个很难kill的脚本
# 


function trapped {
    if [ "$1" = "USR1" ]; then
        echo "Got me with a $1 trap!"
        exit
    else
        echo "Received $1 trap--neener, neener"
    fi
}

#用trap命令指定遇到 各种信号时的行为
#本例中，指定的行为是执行函数"trapped 信号名"
trap "trapped ABRT" ABRT
trap "trapped EXIT" EXIT
trap "trapped HUP"  HUP
trap "trapped INT"  INT
trap "trapped KILL" KILL   # This won't actually work
trap "trapped QUIT" QUIT
trap "trapped TERM" TERM
trap "trapped USR1" USR1   # 注意，这是用户定义的信号


# Just hang out and do nothing, without introducing "third-party"
# : behavior such as if we used 'sleep'
# 注意死循环的条件可以是以下两个中的一个
#while (( 1 )); do
while [ 0 ]; do
    :   # : is a NOOP
    sleep 2
done

