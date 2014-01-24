# cookbook filename: select_dir

#Finished选项 和 根目录下的所有文件（每个文件都是一项）
directorylist="Finished $(ls /)"

#PS3的值影响select命令的输出
PS3='Directory to process? ' # Set a useful select prompt

directory = ''
until [ "$directory" == "Finished" ]; do
    printf "%b" "\a\n\nSelect a directory to process:\n" 
    #在一个列表中选择一项到directory中
    select directory in $directorylist; do
    # 如果选择的是列表中的项，则directory为该项的值，否则directory为空

        # User types a number which is stored in $REPLY, but select
        # returns the value of the entry
        # 如果选择 Finished ,则结束
        if [ "$directory" = "Finished" ]; then
            echo "Finished processing directories."
            break
	# 如果选择是目录中的一个
        elif [ -n "$directory" ]; then
            echo "You chose number $REPLY, processing $directory ..."
            # 在这里加入对该选项进行的操作
	    # 。。。一些代码
            break
        # 其他选择都是非法的
        else
            echo "Invalid selection!"
        fi # end of handle user's selection

    done # end of select a directory
done # end of while not finished
