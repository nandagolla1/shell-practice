#!/bin/bash

NUMBER1=100
NUMBER2=nanda

TIMESTAMP=$(date)
echo "script executed at : $TIMESTAMP"

sum=$(($NUMBER1+$NUMBER2))

echo "the sum of $NUMBER1 and $NUMBER2 is : $sum"