#!/usr/bin/env bash
# cookbook filename: chkpath.1
# Check your $PATH for world-writable(所有人都可以读的) or missing directories
# 找出所有人都可以读的目录,和不存在的文件

exit_code=0

# 见5.18 ${name//pattern/string} 替代所有的符合正则表达是的字符串
# 将所有的:改成空格,然后就可以用for循环了
for dir in ${PATH//:/ }; do
    [ -L "$dir" ] && printf "%b" "symlink, "
    if [ ! -d "$dir" ]; then
        printf "%b" "missing\t\t"
          (( exit_code++ ))
    elif [ "$(ls -lLd $dir | grep '^d.......w. ')" ]; then
          printf "%b" "world writable\t"
          (( exit_code++ ))
    else
          printf "%b" "ok\t\t"
    fi
    printf "%b" "$dir\n"
done
exit $exit_code
