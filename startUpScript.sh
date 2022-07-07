#!/bin/bash
baseUrl="https://raw.githubusercontent.com/SamTV12345/docker-compose-files/main/"

VAULTWARDEN="vaultwarden"

choice=$(whiptail --title "Choose the service to deploy" --radiolist \
  "Choose one?" 20 70 5 \
  $VAULTWARDEN "Vaultwarden " OFF 3>&1 1>&2 2>&3)

queryUrl=''
service=''
filename='docker-'
filesuffix='.yaml'
if [ "$choice" = $VAULTWARDEN ]; then
  queryUrl=$baseUrl$VAULTWARDEN"/docker-compose.yaml"
  service=$VAULTWARDEN
  echo "Signups allowed(y/n)?"
  read -r
  if [[ ${REPLY} = 'y' ]]; then
    echo "SIGNUP_ALLOWED=true" >"vaultwarden.env"
  else
    echo "SIGNUP_ALLOWED=false" >"vaultwarden.env"
  fi

  echo "Disable Admin console?"
  read -r
  if [[ ${REPLY} = 'y' ]]; then
    echo "DISABLE_ADMIN_TOKEN=true" >>"vaultwarden.env"
  else
    echo "DISABLE_ADMIN_TOKEN=false" >>"vaultwarden.env"
  fi

  echo "Enter port for vaultwarden?"
  read -r
  echo "PORT=${REPLY}">> "vaultwarden.env"

  echo "Enter Volume mount?"
  read -r
  echo "VOLUME_MOUNT=${REPLY}">> "vaultwarden.env"

fi

if [ "$queryUrl" != "" ]; then
  curl $queryUrl >$filename$service$filesuffix
  docker-compose -f $filename$service$filesuffix up -d
fi
