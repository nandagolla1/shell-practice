#!/bin/bash

NUMBER1=$1

# -gt --> greater than
# -lt --> less than
# -ne --> not equal
# -eq --> equal

if [ NUMBER1 -lt 10 ]
then
    echo "the given number $NUMBER1 is less than 10"
else
    echo "the given number $NUMBER1 is greater than 10"
fi