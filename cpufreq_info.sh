#!/bin/bash
#set -x
if(($# == 1))
then
	sleep_time=$1
else
	sleep_time=3
fi
j=0

while true
do
	((j++))
	echo "${j}:"
	for((i=0;i<8;i++))
	do
		online_cpu=`adb shell cat sys/devices/system/cpu/cpu$i/online`
		online_cpu=${online_cpu:0:1}
		if (($online_cpu == "1"))
		then
			cur_freq=`adb shell cat sys/devices/system/cpu/cpu$i/cpufreq/scaling_cur_freq`
			if ((${cur_freq:1:1} != 's'))
			then
				echo "cpu$i $cur_freq"
			fi
		fi
	done
	echo ""
	sleep "$sleep_time"
done
