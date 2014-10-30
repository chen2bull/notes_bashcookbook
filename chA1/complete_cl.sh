#!/usr/bin/env bash

## cc的作用是热更指定的配置模块哦

function __parser_cl() {
    local curarg=${COMP_WORDS[COMP_CWORD]}
    local ARGLEN=$(expr length "${curarg}")

    # 防止输出过多,在输入字符个数大于2的时候才出发
    if [ ${ARGLEN} -ge 2 ]; then
        local options=$(cat "/root/.m15comp_erl.index")
        COMPREPLY=( $(compgen -W "${options}" -- "${curarg}") )
    fi
}

complete -F __parser_cl cl