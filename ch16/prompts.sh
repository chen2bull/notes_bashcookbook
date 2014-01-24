# cookbook filename: prompts

# User name @ short hostname, the date and time and the current working
# directory (CWD):
# 如：[cmj@PC 三 10月 23 23:15] ~/a_files/ $
# 10月23日，星期三  # 其中PC是电脑名
export PS1='[\u@\h \d \A] \w \$ '


# User name @ long hostname, the date and time in ISO 8601 format and the
# basename of the current working directory (\W):
# 如,[cmj@PC 2013-10-23 23:17:35+0800] ch16 $
export PS1='[\u@\H \D{%Y-%m-%d %H:%M:%S%z}] \W \$ '


# User name @ short hostname, bash version, and the current working
# directory (\w):
# 如：[cmj@PC 4.2.25 ~/a_files/aa.coding/sa-bash/bashcookbook/ch16
# 其中PC是电脑名,4.2.25是bash的版本
export PS1='[\u@\h \V \w] \$ '


# New line, user name @ hostname, base PTY, shell level, history number, new
# line, and full working directory name ($PWD).
# 如：0是base PTY，1是shell level，576 是 history number，该提示符有换行
# [cmj@PC 0:1:576]
# /home/cmj/a_files/aa.coding/sa-bash/bashcookbook/ch16
export PS1='\n[\u@\h \l:$SHLVL:\!]\n$PWD\$ '


# User name @ short hostname, the exit status of the last command and the
# current working directory.
# 如下：0是上一条命令的返回值
# [cmj@PC 0 ~/a_files/aa.coding/sa-bash/bashcookbook/ch16
export PS1='[\u@\h $? \w \$ '


# Number of jobs in the background
# [cmj@PC jobs:0]
# /home/cmj/a_files/aa.coding/sa-bash/bashcookbook/ch16$
export PS1='\n[\u@\h jobs:\j]\n$PWD\$ '


# User, short hostname, tty, level, history, jobs, version and full
# working directory name:
# [cmj@PC t:0 l:1 h:596 j:0 v:4.2.25]
# /home/cmj/a_files/aa.coding/sa-bash/bashcookbook/ch16
export PS1='\n[\u@\h t:\l l:$SHLVL h:\! j:\j v:\V]\n$PWD\$ '


# user@host, T for ptty, L for shell level, C for command number, and the
# date and time in ISO 8601.
# [cmj@PC:T0:L1:C598:2013-10-23_23:28:46_CST]
# /home/cmj/a_files/aa.coding/sa-bash/bashcookbook/ch16
export PS1='\n[\u@\h:T\l:L$SHLVL:C\!:\D{%Y-%m-%d_%H:%M:%S_%Z}]\n$PWD\$ '


# User name @ short hostname, and the current working directory in light
# blue:
# 蓝色的如下字符
# [cmj@PC:~/a_files/aa.coding/sa-bash/bashcookbook/ch16]$ 
export PS1='\[\033[1;34m\][\u@\h:\w]\$\[\033[0m\] '


# User name @ short hostname, and the current working directory in both the
# xterm title bar and in the prompt itself.
# 将Promt和终端窗口的标题都设成
# [cmj@PC:~/a_files/aa.coding/sa-bash/bashcookbook/ch16]$ 
export PS1='\[\033]0;\u@\h:\w\007\][\u@\h:\w]\$ '


# Both color and xterm updates:
export PS1='\[\033]0;\u@\h:\w\007\]\[\033[1;34m\][\u@\h:\w]\$\[\033[0m\] '
