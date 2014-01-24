#!/usr/bin/env bash
# cookbook filename: func_choice.2.sh

#假定用户已经输入了值到变量THISPACKAGE中，
#要求用户确认或者重新输入
CHOICE=''
until [ "$CHOICE" = "y" ]; do
    printf "%b" "This package's date is $THISPACKAGE\n" >&2
    read -p "Is that correct? [Y/,<New date>]: " CHOICE
    if [ -z "$CHOICE" ]; then
        CHOICE='y'
    elif [ "$CHOICE" != "y" ]; then
        printf "%b" "Overriding $THISPACKAGE with ${CHOICE}\n"
        THISPACKAGE=$CHOICE
    fi
done

# Build the package here
