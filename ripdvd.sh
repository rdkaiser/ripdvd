#!/bin/bash

HANDBRAKE_CLI='/usr/bin/HandBrakeCLI'
DVD_INFO='/usr/bin/cd-info -dvd'
EXT='m4v'


INDEV=$( $DVD_INFO | grep 'CD location' | awk -F ':' '{print $2}' | sed 's/ //' )

echo -e -n  "Enter a destination directory: "
read VID_DIR

echo -e -n "\nEnter a title for the file to be encoded: "
read TITLE

echo -e -n "\nEnter the handbrake preset you wish to apply: "
read PRESET

echo -e "\nDoes everything look correct? [Y/n] \n"
echo -n " $HANDBRAKE_CLI -i $INDEV -o $VID_DIR/$TITLE.$EXT -Z $PRESET "
read q

if [ $q == 'y' ]; then
	echo "OK. Encoding file..."
	$HANDBRAKE_CLI -i $INDEV -o $VID_DIR/$TITLE.$EXT -Z $PRESET
else
	echo "Exiting..."
	exit 1
fi

exit 0

