#!/usr/bin/env bash
# cookbook filename: suffixer
#
# rename files that end in .bad to be .bash
# 批量修改文件名

for FN in *.bad
do
    if [ -f $FN ];then
	mv "${FN}" "${FN%bad}bash" # .badfile.bad 会被替换成.badfile.bash
	#比用${FN/.bad/.bash}要好很多(因为.badfile.bad 替换.bashfile.bad)
    fi
done
