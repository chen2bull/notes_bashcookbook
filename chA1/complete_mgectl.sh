#!/usr/bin/env bash

# 这是一个路由函数,根据参数的不同路由到不同的函数
function __parser_mgectl_HUB() {
    #$COMP_CWORD是系统自动变量，表示当前命令单词索引。 0是第一个单词(也就是mgectl)的索引号，。 
    case $COMP_CWORD in
        0)#仍在完成根命令，这里不需要处理 
        ;;
        1)  #根命令已经完成，这里开始补充一级主命令
            #${COMP_WORDS[0]}是根命令，在这个例子中就是mgectl
            eval __parser_mgectl_$(basename ${COMP_WORDS[0]})
        ;;  
        2|*)  #一级主命令已经完成，这里开始补充一级主命令的选项
            #${COMP_WORDS[1]}是一级主命令，在这个例子中就是stop、debug或者manager
            case "${COMP_WORDS[$COMP_CWORD - 1]}" in
                stop|debug|manager|hot_update)
                    eval __parser_mgectl_${COMP_WORDS[$COMP_CWORD - 1]};;
                *)
                    : ;;
            esac
#        *)
#            :   #空指令
#        ;;
    esac
}

function __parser_mgectl_mgectl() {
    local curarg=${COMP_WORDS[COMP_CWORD]} 
    local options="start stop empty live manager debug"
    COMPREPLY=( $(compgen -W "${options}" -- "${curarg}") )
}

function __parser_mgectl_stop() {
    COMPREPLY="gateway"
}
function __parser_mgectl_debug() {
    local curarg=${COMP_WORDS[COMP_CWORD]}
    local options="cmj abc ztf wja xcf flq wyy wlpy"
    local len=$(expr length "${curarg}")
    if [ $len -eq 0 ]; then
        curarg="xxx"
    fi
    COMPREPLY=( $(compgen -W "${options}" -- "${curarg}") )
}

function __parser_mgectl_manager() {
    local curarg=${COMP_WORDS[COMP_CWORD]} 
    local options="hot_update reload_config"
    COMPREPLY=( $(compgen -W "${options}" -- "${curarg}") )
}

function __parser_mgectl_hot_update() {
    local curarg=${COMP_WORDS[COMP_CWORD]}
    local ARGLEN=$(expr length "${curarg}")

    # 防止输出过多,在输入字符个数大于2的时候才出发
    if [ ${ARGLEN} -ge 2 ]; then
        local options=$(cat "/root/.m15comp_erl.index")
        COMPREPLY=( $(compgen -W "${options}" -- "${curarg}") )
    fi
}

function __parser_mgectl_reload_config() {
    local curarg=${COMP_WORDS[COMP_CWORD]}
    local ARGLEN=$(expr length "${curarg}")

    # 防止输出过多,在输入字符个数大于2的时候才出发
    if [ ${ARGLEN} -ge 2 ]; then
        local options=$(cat "/root/.m15comp_config.index")
        COMPREPLY=( $(compgen -W "${options}" -- "${curarg}") )
    fi
}
complete -F __parser_mgectl_HUB mgectl


# 如果想要提示文件名,可以用以下的方式
#    case "${prev}" in
#        -f|--file)
#            COMPREPLY=( $(compgen -o filenames -W "`ls *.sh`" -- ${cur}) )
#            ;;
#    esac

# ./mgectl start
# ./mgectl stop
# ./mgectl stop gateway
# ./mgectl live
# ./mgectl empty
# ./mgectl debug cmj
# ./mgectl debug xxx
# ./mgectl debug abc
# ./mgectl manager hot_update
# ./mgectl manager reload_config
