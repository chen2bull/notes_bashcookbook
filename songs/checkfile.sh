#!/usr/bin/env bash
# cookbook filename: checkfile.sh
#
DIRPLACE=/tmp
INFILE=/home/yucca/amazing.data
OUTFILE=/home/yucca/more.results

# -d 测试是否为目录
if [ -d "$DIRPLACE" ]
then
    cd $DIRPLACE
    # -e 测试文件是否存在
    if [ -e "$INFILE" ]
    then
	# -w 测试是否可写,-x则测试是否可执行
        if [ -w "$OUTFILE" ]
        then
            doscience < "$INFILE" >> "$OUTFILE"
        else
            echo "can not write to $OUTFILE"
        fi
    else
        echo "can not read from $INFILE"
    fi
else
    echo "can not cd into $DIRPLACE"
fi
