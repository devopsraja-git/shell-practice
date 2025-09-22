#!/bin/bash

# Identify Primer numbers

echo "Please enter the number: "
read NUMBER

if [ $($($(NUMBER) % $(NUMBER))) -eq 0 -gt 1 ]; then
    echo "Given number  $NUMBER is a PRIME Number"
else
    echo "Given number $NUMBER is not a PRIME Number"
fi