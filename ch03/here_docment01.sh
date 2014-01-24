#!/usr/bin/env bash
#
#这是一个here docment
#

#两个EOF（EOF可以换成其他字母）之间的内容作为grep命令的输入，
#"$1"是第一个参数
grep $1 <<EOF
mike x.123
joe  x.234
sue  x.555
pete x.818
sara x.822
bill x.919
EOF