#!/bin/bash

file_path=$1


ls -l $file_path

if [ $? -ne 0 ]; then
    echo "File path doesn't exist"
else
    echo "File path $1 exists and its list is: '$(ls -l $file_path)'"
fi