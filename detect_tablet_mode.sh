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
#
#Messing around to try to run onboard osk
#while true
#do
	#echo "$(libinput debug-events --device /dev/input/event4)"
	#echo "$(libinput debug-events --device /dev/input/event4 | grep state)"
#	if [ "$(libinput debug-events --device /dev/input/event4 | grep state)" = "event4   SWITCH_TOGGLE           +0.000s       switch tablet-mode state 1" ]; then
#		echo "tablet"
#	elif [ "$(libinput debug-events --device /dev/input/event4 | grep state)" = "event4   SWITCH_TOGGLE           +0.000s       switch tablet-mode state 0" ]; then
#		echo "laptop"
#	else
#		echo "unknown"
	#if ! pgrep -x "onboard" > /dev/null; then
	#	onboard &
	#fi
#	fi
	#sleep 1
#done
