#!/usr/bin/env bash
# cookbook filename: getopts_example
#
# using getopts
#
aflag=
bflag=
#内嵌命令getopts从命令行参数中寻找a或b选项
#":"在"b"的后面,表示b选项需要一个参数
#getopts会将找到的选项赋值给第二个参数(本例中为OPTION)
while getopts 'ab:' OPTION
do
  case $OPTION in
  a)    aflag=1
        ;;
  b)    bflag=1
	# 如果是带参数的选项,会将选项的值赋给"$OPTARG"(固定的变量名)
	# 在处理该选项时,保存"$OPTARG"的值即可
        bval="$OPTARG"
        ;;
  # ?是通配符,表示得到其它选项
  # $(basename $0) 是脚本名字(不带路径的)
  ?)    printf "Usage: %s: [-a] [-b value] args\n" $(basename $0) >&2
        exit 2
        ;;
  esac
done
# $OPTIND(固定变量名)将被设置成,未取出的命令行参数
# 如 ./myscript -a -b alt something,上面的处理完成后,$OPTIND会被设置成4
# 如果是 ./myscript -a something,则$OPTIND会被设置成2
# shift [N] 用位置参数 $N+1、$N+2 ... 代替 $1、$2 ...
shift $(($OPTIND – 1))

if [ "$aflag" ]
then
  printf "Option -a specified\n"
fi
if [ "$bflag" ]
then
  printf 'Option -b "%s" specified\n' "$bval"
fi
printf "Remaining arguments are: %s\n" "$*"
