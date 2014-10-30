#!/usr/bin/env bash

if [ -d /data/mge/script/completion ]; then
    __FILE_LS=$(find /data/mge/script/completion -name "complete*.sh")
    for __FILE in ${__FILE_LS}; do
        source "$__FILE"
    done

fi
alias bindex='/data/mge/script/completion/build_comp_index.sh'
__FILE_LS=$(find /root/ -name .m15comp*.index -cmin +30)
__FILE_LEN=$(expr length "${__FILE_LS}")
if [ ${__FILE_LEN} -ne 0 ]; then
    bindex
fi