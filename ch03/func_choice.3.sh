# cookbook filename: func_choice.3

#输入自己最喜欢的颜色，或者不输入
read -p "Enter your favorite color, if you have one: " CHOICE
if [ -n "$CHOICE" ]; then
    printf "%b" "You chose: $CHOICE"
else
    printf "%b" "You do not have a favorite color."
fi
