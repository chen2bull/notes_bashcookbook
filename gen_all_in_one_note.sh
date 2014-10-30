#!/usr/bin/env bash

ALLIN_1FILE_NAME="all_in_one.txt"
echo "这是一个生成的文件,不要直接编辑" > ${ALLIN_1FILE_NAME}

## find ch* -name 'note*.txt' -exec ./mj_cat {} \;

ALL_NOTE_FILES=$(find ch* -name 'note*.txt')
for NOTE_F in ${ALL_NOTE_FILES}; do
    echo "========================================================" >> ${ALLIN_1FILE_NAME}
    cat $NOTE_F >> ${ALLIN_1FILE_NAME}
done