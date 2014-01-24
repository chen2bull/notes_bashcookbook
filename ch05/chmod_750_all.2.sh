#!/usr/bin/env bash
# cookbook filename: chmod_750_all.2.sh
#
# change permissions on a bunch of files
# with better quoting in case of filenames with blanks
#
# 推荐的写法！！！！
# 注意"$@",是有双引号的
for FN in "$@"
do
    #注意"$FN",是有双引号的
    chmod 0750 "$FN"
done
