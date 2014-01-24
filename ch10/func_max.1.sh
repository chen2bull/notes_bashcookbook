# cookbook filename: func_max.1

#做好要做参数检查
function max_usage() {
    printf "usage: %s  number1 number2 \n" $1
} >&2  #可以将整个函数的输出都重定向到一个文件

# define the function:
# 虽然可以省略 function和括号 两个中的一个。
# 但为了可以grep和可读性，不要省略。
function max ()
{
    #参数检查的代码
    if [ $# -lt 2 ];then
	max_usage $FUNCNAME
	return 1
    fi

    local HIDN
    if [ $1 -gt $2 ]
    then
        BIGR=$1
	echo "$1" is bigger then "$2"
    else
        BIGR=$2
	echo "$2" is bigger then "$1"
    fi
    HIDN=5
}

