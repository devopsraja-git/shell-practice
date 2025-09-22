#!/bin/bash

# Identify Prime numbers

echo "Please enter your number: "
read num

echo "Given number is: $num"
if [ $num -lt 1 ]; then
    echo "$num is not a PRIME Number"
elif [ $num -eq 2 ]; then
    echo "$num is a PRIME Number"
elif [ $num -eq 3 ]; then
    echo "$num is a PRIME Number"
elif [ $(($num % 2)) -eq 0 ]; then
    echo "$num is not a PRIME Number"
elif [ $(($num % 3)) -eq 0 ]; then
    echo "$num is not a PRIME Number"
else
    echo "$num is a PRIME Number"
fi