#
# cookbook filename: asar.awk
#

#只有 NF > 7的情况下才执行代码块
NF > 7 {
        user[$3]++
    }

#结束是，用foreach循环遍历 哈希表user
END {
        for (i in user)
        {
            printf "%s owns %d files\n", i, user[i]
        }
    }

