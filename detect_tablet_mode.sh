#!/bin/bash
#
#Check if it's in tablet mode
libinput debug-events --device /dev/input/event4 | while read line; do
mode=$(echo "$line" | grep -o 'state [0-9]' | awk '{print $2}')
if [ "$mode" = "1" ]; then
	echo "tablet"
	exit 0
else 
 	echo "laptop"
	exit 0
fi
done
