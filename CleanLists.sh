#!/bin/bash

##################################################################
# This program is to clean wordlist(s) and remove lines           
# less than 7 chars or greater than 23 chars. 
# It then sorts and removes duplicates from all the wordlists.
# 
# CAREFUL: The Last argument given on the command line is the output file
# 
##################################################################


start=`date +%s`


if [[ "$#" -lt 2 ]];then
	echo "USAGE: $0  [filesntoclean] [output file] ";
	exit 1

else

vars=""
max="$#"
let i=1

for x in $@; do
	touch tempx
	if [ $i -ne $max ];then
		vars+="$x "
	else
		out=$x
	fi
	let i=i+1
	# remove lines less than 7 and greater than 23	
	echo "Removing lines less than 7 and greater than 23 from " $x"."
	echo ""

	LC_ALL=C grep -x '.\{7,23\}' "$x" > tempx
	mv tempx "$x"

done

LC_ALL=C sort -T . -S 5M -u $vars -o "$out" 

fi

end=`date +%s`
#runtime=$((end-start))
runtime=$( echo "$end - $start" | bc -l )

echo "Processing completed, it took" $runtime " seconds."
echo ""














######################################################################
######################################################################
##!/bin/sh

## A POSIX variable
#OPTIND=1         # Reset in case getopts has been used previously in the shell.

## Initialize our own variables:
#output_file=""
#verbose=0

#while getopts "h?vf:" opt; do
#    case "$opt" in
#    h|\?)
#        show_help
#        exit 0
#        ;;
#    v)  verbose=1
#        ;;
#    f)  output_file=$OPTARG
#        ;;
#    esac
#done

#shift $((OPTIND-1))

#[ "$1" = "--" ] && shift

#echo "verbose=$verbose, output_file='$output_file', Leftovers: $@"

## End of file

