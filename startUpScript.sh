#!/bin/bash
baseUrl="https://raw.githubusercontent.com/SamTV12345/docker-compose-files/main/"

VAULTWARDEN="vaultwarden"

choice=$(whiptail --title "Choose the service to deploy" --radiolist \
  "Choose one?" 20 70 5 \
  $VAULTWARDEN "Vaultwarden " OFF 3>&1 1>&2 2>&3)

if test -f "$PWD/.env"
then
  echo "Do you want to override the existing .env file? (y/n)"
  read -r
  if [ "$REPLY" = "y" ]
  then
    echo "Overriding .env file"
  else
    echo "Stopping process..."
    exit 0
fi
fi

queryUrl=''
service=''
filename='docker-'
filesuffix='.yaml'


#
# Vaultwarden config
#
if [ "$choice" = $VAULTWARDEN ]; then
  queryUrl=$baseUrl$VAULTWARDEN"/docker-compose.yaml"
  service=$VAULTWARDEN
  echo "Signups allowed(y/n)?"
  read -r
  if [[ ${REPLY} = 'y' ]]; then
    echo "SIGNUP_ALLOWED=true" >".env"
  else
    echo "SIGNUP_ALLOWED=false" >".env"
  fi

  echo "Disable Admin console?"
  read -r
  if [[ ${REPLY} = 'y' ]]; then
    echo "DISABLE_ADMIN_TOKEN=true" >>".env"
  else
    echo "DISABLE_ADMIN_TOKEN=false" >>".env"
  fi

  echo "Enter port for vaultwarden?"
  read -r
  echo "PORT=${REPLY}">> ".env"

  echo "Enter Volume mount?"
  read -r
  echo "VOLUME_MOUNT=${REPLY}">> ".env"

fi

#
# MariaDB
#

if [ "$queryUrl" != "" ]; then
  curl $queryUrl >$filename$service$filesuffix
  docker-compose -f $filename$service$filesuffix up -d
fi