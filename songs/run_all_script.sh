#!/usr/bin/env bash

#用 run_all_script <脚本文件s所在的文件夹>，执行该目录下的所有文件
function run_all_script {
for SCRIPT in $1;do
    # -f是文件，-a相当与and，-x 文件具有可执行权限
    if [ -f $SCRIPT -a -x $SCRIPT ];then
	$SCRIPT
    fi
done
}

