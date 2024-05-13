#! /bin/bash

num=(2 6 1 4 9 5 3)

sorted=($(echo "${num[@]}" | tr ' ' '\n' | sort -n))

echo "Original Array: ${num[@]}"
echo "Sorted Array: ${sorted[@]}"