#!/usr/bin/sh

# TODO: check args and check arg is number > 1

num=$1

i=2
while [ $i -lt $num ]
do
    # check divisibility
    if [ $(( num % i )) -eq 0 ]
    then
        echo "$num is not prime"
        exit 1
    fi


    i=$(( i + 1 ))
done

echo "$num is prime"
exit 0