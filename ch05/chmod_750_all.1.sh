# cookbook filename: chmod_750_all.1.sh
# 
# 
# 这是一种过时的用法，不要使用这个文件，看chmod_750_all.2.sh
# 遍历所有的命令行参数，$*就是所有的命令行参数组成的列表
for FN in $*
do
    echo changing $FN
    chmod 0750 $FN
done
