#!/bin/bash


# error if no argument given
if [[ "$#" -ne 2 ]];then
	echo "$#";
	echo "Needs line number and file to search"
else
# print the desired line
	awk '{ if(NR==n) print $0 }' n=$1 $2

fi


