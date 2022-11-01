#! /bin/bash

count=88

if [ $count -eq 88 ]
then
    echo "this condition is true."
else
    echo "this condition is false."
fi

if (( $count < 87 )) 
then
    echo "this condition is true."
else
    echo "this condition is false."
fi
