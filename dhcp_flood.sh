#!/bin/bash

str="01 02 03 04 05 06 07 08 09 10"

if [ -z $1 ]; then
	echo "No interface provided."
	exit 2
fi

ifconfig $1 2> /dev/null
if [ $? -ne 0 ]; then
	echo "Invalid interface $1."
	exit 3
fi

for i in $str; do
	for j in $str; do
		(sudo ./dhtest -m 00:00:$j:$i:00:00 -i $1 &) ;
	done;
done
