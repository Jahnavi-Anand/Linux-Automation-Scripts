#! /bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2

sum=$((num1 + num2))
diff=$((num1 - num2))
mul=$((num1 * num2))
div=$((num1 / num2))

echo "Sum: $sum , Difference: $diff , Multiplication: $mul , Division: $div "