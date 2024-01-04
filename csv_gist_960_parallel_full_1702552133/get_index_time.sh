#! /bin/bash
#
# get_index_time.sh
# Copyright (C) 2023 rzavalet <rzavalet@noemail.com>
#
# Distributed under terms of the MIT license.
#


TESTOUT=./test_1702473417.out

grep 'creating index' ${TESTOUT} | perl -ne '/(\d\d\d\d\-\d\d\-\d\d \d\d:\d\d:\d\d,\d\d\d)/ and print "$1\n"' | tr ',' '.' > /tmp/start.txt
grep 'done!' ${TESTOUT} | perl -ne '/(\d\d\d\d\-\d\d\-\d\d \d\d:\d\d:\d\d,\d\d\d)/ and print "$1\n"' | tr ',' '.' > /tmp/end.txt

echo "extension,m,start,end" > create.csv

printf "Lantern,16\n"   >  /tmp/col1.txt
printf "Lantern,24\n"  >> /tmp/col1.txt
printf "Pgvector,16\n"  >> /tmp/col1.txt
printf "Pgvector,24\n" >> /tmp/col1.txt

paste -d ',' \
  /tmp/col1.txt \
  <(while read line; do date -d "${line}" "+%s"; done < /tmp/start.txt) \
  <(while read line; do date -d "${line}" "+%s"; done < /tmp/end.txt) \
  >>  create.csv

