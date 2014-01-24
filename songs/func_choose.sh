#!/usr/bin/env bash
# cookbook filename: func_choose.sh
# Let the user make a choice about something and execute code based on
# the answer
# 按照以下的用法(使用的例子在本文件的末端)
# Called like: choose <default (y or n)> <prompt> <yes action> <no action>
# e.g. choose yes 'Yes for ls,no for pwd!' ls pwd
function choose {

    local default="$1"
    local prompt="$2"
    local choice_yes="$3"
    local choice_no="$4"
    local answer

    read -p "$prompt" answer
    [ -z "$answer" ] && answer="$default"

    case "$answer" in
        [yY1] ) exec "$choice_yes"
            # error check
            ;;
        [nN0] ) exec "$choice_no"
            # error check
            ;;
        *     ) printf "%b" "Unexpected answer '$answer'!"  >&2 ;;
    esac
} # end of function choose

# 按照以下的用法
choose yes 'Yes for ls,no for pwd!' ls pwd
# 当命令过长时，也可以用以下的方式
# e.g. choose "y" \
#       "Do you want to play a game?" \
#       /usr/games/GlobalThermonucularWar \
#       'printf "%b" "See you later Professor Falkin."' >&2
# Returns: nothing

