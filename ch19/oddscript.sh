#!/usr/bin/env bash

#good nodes: 0
#bad nodes: 6
#miss nodes: 0
#GOOD=6 BAD=0 MISS=0

badnode=6

printf "good nodes: %d\n" $goodnode
printf "bad nodes: %d\n" $badnode
printf "miss nodes: %d\n" $missnode
#下面语句将输出GOOD=6 BAD=0 MISS=0
printf "GOOD=%d BAD=%d MISS=%d\n" $goodnode $badnode $missnode

#下面的语句才能正确地运行
#printf "GOOD=%d BAD=%d MISS=%d\n" "$goodnode" "$badnode" "$missnode"

