#!/bin/bash

echo "Please enter your name..."

read userName

echo Thank You $userName

git status >> test.txt

diff test.txt download-ready.txt >> difference.txt

if [ -s difference.txt ]
then
	echo "you have made changes to the files..."
	echo "saving the changes to the cloud..."

	git add .
	git commit -m "automatically making commit"
	git push

	echo "changes saved to the cloud"
	echo "downloading files from the cloud..."

	echo >> pull-history.txt
	echo $userName >> pull-history.txt
	git pull >> pull-history.txt

	echo "all files are up to date with the cloud"
else
	echo "you have made no changes to the files"
	echo "downloading files from the cloud..."

	echo >> pull-history.txt
	echo $userName >> pull-history.txt
	git pull >> pull-history.txt

	echo "all the files are up to date with the cloud"
fi

> difference.txt
> test.txt
