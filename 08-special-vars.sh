#!/bin/bash

echo "All variables passed to this script: $@"
echo "All variables passed to this script: $*"

echo "Script name: $0"
echo "Current directory: $PWD"

echo "Who is running this: $USER"
echo "Home directory is: $HOME"
echo "PID of this script: $$"

sleep 50&
echo "PID of last command in background is: $!"