#! /bin/bash

read -p "Enter your Marks: " marks

if [ $marks -gt 80 ]; then
	echo "Distinction"
elif [ $marks -gt 60 ]; then
	echo "First Division" 
elif [ $marks -gt 35 ]; then
	echo "pass" 
else
	echo "fail"
fi