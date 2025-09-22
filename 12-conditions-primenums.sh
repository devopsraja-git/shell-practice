#!/bin/bash

# Identify Primer numbers

echo "Please enter the number: "
read NUMBER

if [ $NUMBER -lt 1 ]; then
    echo "Given number  $NUMBER is not a PRIME Number"
elif [ $NUMBER -eq 2 ]; then
    echo "Given number $NUMBER is a PRIME Number"
elif [ $NUMBER -eq 3 ]; then
    echo "Given number $NUMBER is a PRIME Number"
elif [ $($(NUMBER)) % 2 -eq 0 ]; then
    echo "Given number $NUMBER is not a PRIME Number"
elif [ $($(NUMBER)) % 3 -eq 0 ]; then
    echo "Given number $NUMBER is not a PRIMER Number"
else
    echo "Given number $NUMBER is a PRIMER Number"
fi