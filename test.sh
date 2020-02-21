#!/bin/bash

max=0
a=8
b=4
c=5

for i in $a $b $c
do
  if [ $i -gt $max ]
  then
    max=$i
  fi
done

echo $max
