#!/bin/bash

echo "Please enter your name..."

read userName

echo Thank You $userName
echo

git status >> test.txt

diff test.txt download-ready.txt >> difference.txt

if [ -s difference.txt ]
then
	echo "you have made changes to the files..."
	echo
	echo "saving the changes to the cloud..."
	echo

	git add .
	git commit -m "automatically making commit"
	git push >> push-info.txt

	echo "changes saved to the cloud"
	echo
	echo "downloading files from the cloud..."
	echo

	echo >> pull-history.txt
	echo $userName >> pull-history.txt
	git pull >> pull-history.txt

	git add .
	git commit -m "updating pull history"
	git push >> push-info.txt

	echo "all files are up to date with the cloud"
	echo
else
	echo "you have made no changes to the files"
	echo 
	echo "downloading files from the cloud..."
	echo

	echo >> pull-history.txt
	echo $userName >> pull-history.txt
	git pull >> pull-history.txt

	git add .
	git commit -m "updating pull history"
	git push >> push-info.txt	

	echo "all the files are up to date with the cloud"
	echo
fi

rm push-info.txt
rm difference.txt
rm test.txt

echo Finished
