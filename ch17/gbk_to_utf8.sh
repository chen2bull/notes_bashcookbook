#/bin/bash

#set -x
TO_DIR="../out_src"
FROM_DIR="."
FILE_PATT="*.java"
#mkdir -p ${TO_DIR}

for FILE_NAME in $(find ${FROM_DIR} -name ${FILE_PATT}); do
OUTFILE=${FILE_NAME/${FROM_DIR}/${TO_DIR}}
mkdir -p $(dirname ${OUTFILE})
touch ${OUTFILE}
iconv -f GBK -t UTF-8 ${FILE_NAME} > ${OUTFILE}
done

echo "共有" $(find ${FROM_DIR} -name ${FILE_PATT} | wc -l) "个文件"
echo "生成" $(find ${TO_DIR} -name ${FILE_PATT} | wc -l) "个文件"

#set +x
