#!/bin/bash 

for FILE_NAME in $(ls);do
	if [ -d $FILE_NAME ] ;then
		LINE_NUM=`find $FILE_NAME -name '*.erl' | xargs cat | wc -l`
		echo $FILE_NAME $LINE_NUM
	fi
	#if [ -f $FILE_NAME ] ;then
		#LINE_NUM=`wc -l`
		#echo $FILE_NAME $LINE_NUM
	#fi 
done


