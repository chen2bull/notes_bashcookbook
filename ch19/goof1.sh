#!/bin/bash -
# common goof:
# X=$Y $Z
# isn't the same as
# X="$Y $Z"
#
OPT1=-l
OPT2=-h
#这样不能正常执行ls -l -h .
#ALLOPT=$OPT1 $OPT2

#这样才能正常执行
ALLOPT="$OPT1 $OPT2"
ls $ALLOPT .