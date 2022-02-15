#! /bin/bash

# // @formatter:off
sudo docker service update --label-add "traefik.docker.network=pihole-stacked_default" --label-add "traefik.port=80"  --label-add "traefik.frontend.rule=PathPrefix:/" --label-add "traefik.backend.loadbalancer.stickiness=true" pihole-stacked

sudo docker service create --name traefik -p8080:80 -p9090:8080 --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock --mode=global --constraint 'node.role == manager' --network pihole-stacked_default traefik:v1.7.30 --docker --docker.swarmmode --docker.watch --web --loglevel=DEBUG


# See https://www.vultr.com/de/docs/sticky-session-with-docker-swarm-ce-on-debian-9