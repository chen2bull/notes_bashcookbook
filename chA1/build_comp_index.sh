#!/usr/bin/env bash

# set -x

if [ "$#" -eq 0 ]; then
    eval "$0" config
    eval "$0" beam
    exit 0
fi

if [ "$1" = "config" ] ; then
    echo "正在更新配置索引"
    SRC_DIR="/data/mge/config/"
    DST_FILE="/root/.m15comp_config.index"
    SUFFIX=".config"
elif [ "$1" = "beam" ]; then
    echo "正在更新代码索引"
    SRC_DIR="/data/mge/src/"
    DST_FILE="/root/.m15comp_erl.index"
    SUFFIX=".erl"
fi

PATTERN="*"${SUFFIX}

ALL_F=$(find "${SRC_DIR}" -name "${PATTERN}" | xargs -i basename {})

ALL_F_NO_SUFF=$(for FN in ${ALL_F}; do
    echo ${FN%${SUFFIX}}
done)

echo "$ALL_F_NO_SUFF" > ${DST_FILE}
echo "更新成功"


