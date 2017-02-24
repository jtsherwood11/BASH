#!/bin/bash

ME=`whoami`
IPCS_M=`ipcs -m | grep $ME | awk '{ print $2 } '`

for id in $IPCS_M; do
	ipcrm -m $id;
done
