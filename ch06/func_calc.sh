# cookbook filename: func_calc

# Trivial command line calculator
function calc
{
    awk "BEGIN {print \"The answer is: \" $* }";
}

echo '$calc 2 + 3 + 4.5'
calc 2 + 3 + 4.5

echo '$calc 2 + 3 + 4'
calc 2 + 3 + 4

echo '$calc \(2 + 2 - 3\) \* 4.5'
calc \(2 + 2 - 3\) \* 4.5

echo \$calc \'\(2 + 2 - 3\) \* 4.5\'
calc '(2 + 2 - 3) * 4.5'