#!/bin/bash

echo "all the arguments passed : $@"
echo "number of argumnets passed to the script : $#"
echo "script name : $0"
echo "current directory : $PWD"
echo "user running the script: $USER"
echo "home directory of the user : $HOME"
echo "pid the script : $$"
sleep 10 &
echo "pid of the back ground process: $!"
echo "status of the previous command : $?"
