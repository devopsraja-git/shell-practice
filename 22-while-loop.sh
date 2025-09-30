#!/bin/bash

# count=5

# echo "Starting countdown.."

# while [ $count -gt 0 ]

# do
#     echo "Time left: $count"
#     sleep 1
#     count=$((count -1))
# done
#     echo "Time's UP!"


echo -n "Enter filename: "
read filename

if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

while IFS= read -r line
do
    echo "Line: $line"
done < "$filename"