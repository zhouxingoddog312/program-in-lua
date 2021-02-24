 #! /bin/bash
cat "$1" |tr -cs '[:alpha:]' '[\012*]' |
tr 'A-Z' 'a-z' |
sort |
uniq -c |
sort -k1nr -k2 |
head -n "$2"
