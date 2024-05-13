#! /bin/bash

read -p "Enter Day of the week: " day

case $day in
	1)
	echo "Equivalent Day: Monday"
	;;
	2)
	echo "Equivalent Day: Tuesday"
	;;
	3)
	echo "Equivalent Day: Wednesday"
	;;
	4)
	echo "Equivalent Day: Thursday"
	;;
	5)
	echo "Equivalent Day: Friday"
	;;
	6)
	echo "Equivalent Day: Saturday"
	;;
	7)
	echo "Equivalent Day: Sunday"
	;;
	*)
	echo "Invalid Input."
	;;
esac