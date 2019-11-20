#!/bin/bash

>> test.txt

git status >> test.txt

diff test.txt download-ready.txt >> difference.txt

if [ -s difference.txt ]
then
	echo "the files are different"
else
	echo "the files are NOT different"
fi
