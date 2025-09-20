#!/bin/bash

# everything in shell is integers
# shell automatically detects & converts data types whether its integer or alphabets or decimal or long etc...
NUMBER1=100
NUMBER2=200
NAME=raja 

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "Sum of 2 numbers is: ${SUM}"


LEADERS=("NTR" "CBN" "YSR" "KCR")

# Size = 4, Max index = 3
echo "First Leader is: ${LEADERS[0]}"
echo "Second Leader is: ${LEADERS[1]}"
echo "Third Leader is: ${LEADERS[2]}"
echo "Fourth Leaders is: ${LEADERS[3]}"
echo "All leaders: ${LEADERS[@]}"
