#!/usr/bin/env bash
# cookbook filename: load_mp3
# Fill up my mp3 player with as many songs as will fit.
# 注意！！！！: This assumes that the mp3 player is mounted on /media/mp3
# 
MP3_PLAYER_DIR=/media/mp3

#
# determine the size of a file,
# 单位为块的数目
function FILESIZE ()
{
   FN=${1:-/dev/null}
   if [[ -e $FN ]]
   then
       # FZ=$(ls -s $FN | cut -d ' ' -f 1)
       set -- $(ls -s "$FN")
       FZ=$1
   fi
}

#
# compute the freespace on the mp3 player
# 单位为块的数目
function FREESPACE
{
   # FREE=$(df /media/mp3 | awk '/^\/dev/ {print $4}')
   # 下面的方法效果和上一行注释相同

   # 一行中如果有以空格分割的多个输出，用以下的方法更高效率
   set -- $(df ${MP3_PLAYER_DIR} | grep '^/dev/')
   FREE=$4
}

# subtract the (given) filesize from the (global) freespace
# 得到剩下的空间
function REDUCE ()
(( FREE-=${1:-0}))

#
# main:
#
let SUM=0
let COUNT=0
export FZ
export FREE
FREESPACE
find . -name '*.mp3' -print | \
(while read PATHNM
do
   FILESIZE "$PATHNM"
   #如果文件大小小于等于剩下的freespace
   if ((FZ <= FREE))
   then
       echo loading $PATHNM
       cp "$PATHNM" "${MP3_PLAYER_DIR}"
       # $?是上一条命令的结果，为0就是正常执行
       if (( $? == 0 ))
       then
	   # 别忘了let 是为了可以执行+=,++等操作
           let SUM+=FZ
           let COUNT++
	   # 减少该文件的空间
           REDUCE $FZ
       else
           echo "bad copy of $PATHNM to /media/mp3"
  	   # 不知道已经拷贝了多少，所以要把它再删除
           rm -f ${MP3_PLAYER_DIR}/$(basename "$PATHNM")

           # recompute because we don't know how far it got
           FREESPACE
       fi
       # any reason to go on?
       if (( FREE <= 0 ))
       then
           break
       fi
   else
       echo skipping $PATHNM
   fi
done
printf "loaded %d songs (%d blocks)"  $COUNT $SUM
printf " onto %s (%d blocks free)\n" "${MP3_PLAYER_DIR}" $FREE
)
# end of script
