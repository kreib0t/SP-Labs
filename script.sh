#!/bin/sh

# description
echo "Creator: Grinevich Kirill 717-1"
echo "Name of program: $0"
echo "prompts for username
if the specified user is not registered in the system, then displays a message about this and re-requests the username
if the specified user is registered in the system, then displays
his unique identifier (UID) and the names of the groups this user belongs to, separated by a space
the main (primary) group must be specified separately"

while :; do
	echo "ENTER USERNAME: "
	read name
	id -u $name 2> /dev/null || var=$? && groups $name 2> /dev/null && var="" && getent group $name | awk -F":" '{print $1}' || echo "user with this name does not exist" 
	echo "if you want to exit press Y or another key if you want to continue: "
	read answer
	case "$answer" in
		Y)
		[ ! -z "$var" ] && echo $var		       	
		   exit ;;
		*) ;;
	esac
done
