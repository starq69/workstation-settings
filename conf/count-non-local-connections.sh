#!/bin/sh -

CONN=`who -T | tr -s ' ' | cut -d ' ' -f 6`

tot=0
for item in $CONN; do tot=$((tot+1)); done;

echo "number of non local connection : $tot"
