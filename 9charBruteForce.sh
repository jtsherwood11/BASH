#!/bin/bash

# This is for brute force cracking of
# 9 character [ alpha numeric ] passwords.


s=$(echo {a..z} {0..9});
for x in $s;
do for y in $s;
do for z in $s;
do for a in $s;
do for b in $s;
do for c in $s;
do for d in $s;
do for e in $s;
do for f in $s;

do echo $x$y$z$a$b$c$d$e$f;
done;
done;
done
