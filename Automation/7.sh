#!/bin/bash

#Define the Threshold in Percentage
threshold=90

#Get current disk usage percentage
disk_usage=$(df -h | grep '/dev/sda3' | awk '{print $5}' | sed 's/%//')

#Check if disk usage exceeds threshold
if [ "$disk_usage" -gt "$threshold" ]; then
	#send an alert
	echo "DIsk Usage is above threshold! Current usage: $disk_usage%"
else
	echo "Disk usage is below threshold, Current usage: $disk_usage%"
fi