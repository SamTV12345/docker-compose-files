#! /bin/bash

docker ps -q | xargs docker stop 

docker ps -q | xargs docker rm

docker pull samuel19982/smartorganizr:latest

docker run -e SPRING_DATASOURCE_URL=jdbc:mysql://192.168.1.35/smartorganizr -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=your-pass -p 80:8080 --restart always -d samuel19982/smartorganizr