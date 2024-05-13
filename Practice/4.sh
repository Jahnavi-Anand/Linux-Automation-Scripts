#! /bin/bash

read -p "Enter your Age: " age

if [ $age -ge 18 ]; then
	echo "Eligible to vote"
else
	echo "Not eligible to vote"
fi