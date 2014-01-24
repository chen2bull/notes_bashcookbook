#!/usr/bin/env bash
# 删除当前目录下，所有复合通配符“*~“的文件
#（即所有emacs产生的临时文件）
# 
#

function delete_tmp_file {
    if [[ $1 == *~ ]] ;then
	if [ -f $1 ];then
	    echo $1 has been delete.
	    rm -rf $1
	fi
    fi

}

#find ./ -type f -exec delete_tmp_file {};

for i in $(find ./ -type f);do
    delete_tmp_file $i
done
