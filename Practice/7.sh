#! /bin/bash

read -p "Enter the number to be checked: " num

if [[ $num =~ ^[0-9]+$ ]]; then
	is_prime=true
	
	for(( i=2; i*i <=num; i++)); do
		if(( num % i == 0));then
			is_prime=false
			break
		fi
	done
	
	if [ "$is_prime" == true ]; then
		echo "Number is Prime"
	else
		echo "Number is Not Prime."
	fi
	
else
	echo "Invalid input!"
fi