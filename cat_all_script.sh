#!/usr/bin/env bash

SH_FILES=$(find ch* -regex ".*sh")
OUTFILE="all_script.txt"

echo "这是一个自动生成的文件,不要编辑" > "${OUTFILE}"
for SH_F in ${SH_FILES} ;do
    echo "================================================================" >> "${OUTFILE}"
    echo -e $SH_F >> "${OUTFILE}"
    echo "================================================================" >> "${OUTFILE}"
    cat "$SH_F" >> "${OUTFILE}"
done

