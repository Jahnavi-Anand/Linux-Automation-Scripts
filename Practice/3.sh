#! /bin/bash

read -p "Enter your Marks: " marks

if [ $marks -gt 35 ]; then
	echo "pass"
else
	echo "fail"
fi