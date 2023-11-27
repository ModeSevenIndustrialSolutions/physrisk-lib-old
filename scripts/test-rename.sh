#!/bin/sh

# set -x

if [ $# -ne 1 ]; then
	echo "Usage:	$0 [test folder]"; exit 1
elif [ ! -d $1 ]; then
	echo "Error: specified target was not a folder"; exit 1
else
	# Target specified was a folder
	TARGET=$1
fi

# Forward
for TEST in $(find $TARGET -name 'test*.py' | xargs)
do
 	PREFIX_STRIP="${TEST/test_/}"
	NEW_TEST="${PREFIX_STRIP/.py/_test.py}"
	echo "Renaming $TEST -> $NEW_TEST"
	git mv "${TEST}" "${NEW_TEST}"
done
