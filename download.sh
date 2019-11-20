#!/bin/bash

echo "Please enter your name..."

read userName

echo Thank You $userName
echo

git status >> test.txt

diff test.txt download-ready.txt >> difference.txt

if [ -s difference.txt ]
then
	echo "You have made changes to the files..."
	echo
	echo "Saving your changes to the Cloud..."
	echo

	git add . >> push-info.txt
	git commit -m "Automatically making commit for $userName"
	git push >> push-info.txt

	echo "Changes saved to the cloud"
	echo
	echo "Downloading files from the cloud..."
	echo

	echo >> pull-history.txt
	echo $userName >> pull-history.txt
	git pull >> pull-history.txt

	git add . >> push-info.txt
	git commit -m "updating pull history"
	git push >> push-info.txt

	echo "All files up to date with the Cloud."
	echo
else
	echo "You have made no changes to the files."
	echo 
	echo "Downloading files from the cloud..."
	echo

	echo >> pull-history.txt
	echo $userName >> pull-history.txt
	git pull >> pull-history.txt

	git add . >> push-info.txt
	git commit -m "updating pull history"
	git push >> push-info.txt	

	echo "All files up to date with the Cloud."
	echo
fi

rm push-info.txt
rm difference.txt
rm test.txt

echo Finished
