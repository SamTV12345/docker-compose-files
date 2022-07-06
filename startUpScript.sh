#!/usr/bin/env bash
baseUrl="https://raw.githubusercontent.com/SamTV12345/docker-compose-files/main/"
echo "The following options are available:"
echo "1: Vaultwarden"
read -r choice

queryUrl=''
service=''
filename='docker-'
filesuffix='.yaml'
if [ "$choice" -eq 1 ]
then
  queryUrl=$baseUrl"vaultwarden/docker-compose.yaml"
  service='vaultwarden'
fi

if [ "$queryUrl" != "" ]
then
  curl $queryUrl > $filename$service$filesuffix
  docker-compose -f $filename$service$filesuffix up -d
fi