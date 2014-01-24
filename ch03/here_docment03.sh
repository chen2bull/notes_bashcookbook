#!/usr/bin/env bash
#
#这是一个here document
#

value=somethings
#...

if [ "$value" = "somethings" ];then
#在缩进的地方用 <<- （唯一的方法）
#不过，emacs中不能为here文档添加缩进，可在其他编辑器中添加tab
    grep $1 <<-'EOF'
	mike $123
	joe  $234
	sue  $555
	pete $818
	sara $822
	bill  $919
	EOF
fi
