#!/usr/bin/env bash
# cookbook filename: interactive

# $-是一个列出当前shell的所有options的字符串
# 或者也可以case "$PS1" in #但是，$-是完美的方法
case "$-" in
    *i*)  # Code for interactive shell here
        echo "interactive shell here";;
    *)    # Code for non-interactive shell here
	echo "non-interactive shell here";;
esac
