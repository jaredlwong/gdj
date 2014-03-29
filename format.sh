#!/bin/sh
FILES=src/*.c
HFILES=src/*.h
FILES="$FILES $HFILES"
echo $FILES
for f in $FILES; do
	f2=`echo $f | sed 's/src/src2/'`
	./aaa --pad-oper --style=1tbs --indent=force-tab < $f > $f2
done

