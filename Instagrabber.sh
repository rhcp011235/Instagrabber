#!/bin/bash
#
# Simple yet effective instagram file saver for videos and pictures
# By: John.b.hale@gmail.com
#
#

echo "Instagrabber.sh version 1.0"
echo "By: John.b.hale@gmail.com";

echo "Enter the type of file you are tying to save: video , picture , followed by [ENTER]:"
read input

echo "Enter the URL of the file you want to download, followed by [ENTER]:"
read URL

if [ "$input" == "picture" ]
then
	echo "We are getting an image from instagram... Hang on..";
	FILE=$(curl -L $URL | grep og:image | cut -d'"' -f4)
else
	echo "We are getting a video from instagram... Hang on..";
	FILE=$(curl -L $URL | grep og:video | cut -d'"' -f4 | head -n 1)
fi

echo "Saving file to: $FILE"
wget $FILE
echo "Saved"

