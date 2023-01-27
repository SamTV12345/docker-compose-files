FROM alpine as downloader

RUN apk add git npm curl
WORKDIR /download
RUN git clone https://github.com/lukin/keywind.git
RUN chmod -R 777 /download

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

WORKDIR /download/keywind
RUN pnpm install
RUN pnpm build


FROM quay.io/keycloak/keycloak:20.0.3 as builder

WORKDIR /keycloak_assets

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

  #RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar
COPY --from=downloader --chown=keycloak:root  /download/keywind/theme /opt/keycloak/themes/

RUN /opt/keycloak/bin/kc.sh build

FROM alpine:latest

COPY --from=builder /opt/keycloak/ /opt/keycloak/

RUN apk add --no-cache openjdk17-jre-headless bash \
                 	--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
WORKDIR /opt/keycloak

ENV KC_DB_URL=jdbc:postgresql://postgres:5432/keycloak
ENV KC_DB_USERNAME=adminuser
ENV KC_DB_PASSWORD=keycloak

ENTRYPOINT ["bash","/opt/keycloak/bin/kc.sh", "start"]