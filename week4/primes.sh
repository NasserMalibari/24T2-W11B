#!/usr/bin/dash

# TODO arg checking / num checking

end=$1
i=2

while [ $i -lt $end ]
do
    if ./is_prime.sh $i > /dev/null
    then
        echo $i
    fi

    i=$(( i + 1 ))
done
