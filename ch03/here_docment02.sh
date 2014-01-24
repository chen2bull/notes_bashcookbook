#!/usr/bin/env bash
#
#这是一个here document
#

#连个EOF之间如果有$,则$1,$2...等等会认为是变量
#grep $1 <<EOF
#mike $123
#joe  $234
#sue  $555
#pete $818
#sara $822
#bill $919
#EOF

#对EOF加了单引号后，here document中的$1,$2等等不再被认为是变量
#下面两种处理，和'EOF'效果一样
#grep $1 <<\EOF
#grep $1 <<EO\F
grep $1 <<'EOF'
mike $123
joe  $234
sue  $555
pete $818
sara $822
bill $919
EOF