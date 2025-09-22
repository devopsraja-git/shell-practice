#!/bin/bash

# Identify Primer numbers

echo "Please enter the number: "
read NUMBER

if [ $NUMBER -lt 1 ]; then
    echo "Given number  $NUMBER is not a PRIME Number"
elif [ $($(NUMBER) % $(NUMBER)) -eq 0 ]; then
    echo "Given number $NUMBER is a PRIME Number"
fi