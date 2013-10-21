#!/bin/bash

$ECHO='/bin/echo'
$SED='/bin/sed'
$AWK='/usr/bin/awk'

DVD_INFO='/usr/bin/cd-info -dvd'
HANDBRAKE_CLI='/usr/bin/HandBrakeCLI'
EXT='m4v'

INDEV=$( $DVD_INFO | grep 'CD location' | $AWK -F ':' '{print $2}' | $SED 's/ //' )

$ECHO -e -n  "Enter a destination directory: "
read VID_DIR

$ECHO -e -n "\nEnter a title for the file to be encoded: "
read TITLE

$ECHO -e -n "\nEnter the handbrake preset you wish to apply: "
read PRESET

$ECHO -e "\nDoes everything look correct? [Y/n] \n"
$ECHO -n " $HANDBRAKE_CLI -i $INDEV -o $VID_DIR/$TITLE.$EXT -Z $PRESET "
read q

if [ $q == 'y' ]; then
	$ECHO "OK. Encoding file..."
	$HANDBRAKE_CLI -i $INDEV -o $VID_DIR/$TITLE.$EXT -Z $PRESET
else
	$ECHO "Exiting..."
	exit 1
fi

exit 0


