#! /bin/bash

read -p "Enter a number: " num

if [[ $num =~ ^[0-9]+$ ]]; then
	number=$num
	num_digits=${#number}
	sum=0
	
	temp=$number
	while ((temp > 0)); do
		digit=$((temp % 10))
		power=1
		
		for ((i=0; i<num_digits; i++)); do
			power=$(( power * digit ))
		done
		
		sum=$((sum + power))
		temp=$((temp / 10))
	done
	
	if [ $sum -eq $number ]; then
		echo "Number is Armstrong"
	else
		echo "Number is not Armstrong"
	fi
else
	echo "Invalid input!"
fi