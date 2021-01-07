#!/bin/bash

SRV="http://127.0.0.1:"$1

# To show the link on terminal
show_link() {

while [ true ]; do

# check whether the host is up or not
if [ "`wget $SRV -O /dev/null -S --quiet 2>&1 | grep '200 OK'`" != "" ]; then
# If is up the show the link
printf "\e[1;92m[\e[0m*\e[1;92m] Juice-Shop ;) :\e[0m\e[1;77m %s\e[0m\n" $SRV
exit 0
fi

done

}

# A function to kill all other open docker container
dock_kill() {

cont=$(docker ps -q)
# Check whether any docker container is running
if [[ $cont == "" ]]; then
printf "\e[1;91m[\e[91m!\e[1;91m] No Docker Container is Running...\n"
exit 1

else
docker kill $(docker ps -q)
printf "\e[1;92m[\e[0m*\e[1;92m] Killed Process...\n"
exit 0
fi

}

# To check if the Specified Port is available or not.
if [ -n $1 ] && [ "$1" -eq "$1" ] 2>/dev/null; then
checkport=$(sudo lsof -P -n -i | grep $1)

if [[ $checkport == "" ]]; then
printf "\e[1;92m[\e[0m*\e[1;92m] Docker Running...\n"
docker run --rm -p $1:3000 bkimminich/juice-shop > /dev/null 2>&1 &
show_link

else
printf "\e[1;91m[\e[91m!\e[1;91m]\e[93m The port\e[1;77m %s\e[93m \e\e[0m\e[1;93mis not available or already in use. Try running docker kill or use another port...\n" $1
exit 1
fi

elif [ -n $1 ] && [[ $1 == "kill" ]]; then
dock_kill

else
# Print Usage
printf "\e[1;92m[\e[0m*\e[1;92m] Usage : juice-shop (port), juice-shop kill\n"
exit 0
fi
