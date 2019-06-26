#!/bin/sh
# This program can be run on your colleague's computer to remind them to lock it when they step away.

# pastable one liner
# text="Please lock your computer when you step away"; osascript -e "set Volume 10"; say "$text"

get_text() {
	# language to push through audio
	text="Please lock your computer when you step away."
	# return the text to caller
	echo "$text"
}


set_max_volume() {
	# turn the mac volume up
	osascript -e "set Volume 10";
}


get_text_to_speech() {
	# call osx 'say' and pass the text to speak aloud
	say $(get_text) 
}


main() {
	set_max_volume     # turn it 11
	get_text_to_speech # read the statement
}


while [ 1 ]; do
	# wait 10.5 minutes
	sleep 630 
	# turn up the volume and speak a message
	main
done
