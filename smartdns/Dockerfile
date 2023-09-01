FROM debian:latest

RUN curl -o /etc/smartdns/smartdns.conf http://192.168.1.24/smartdns.conf


FROM samuel19982/dns:latest

COPY --from=0 /etc/smartdns/smartdns.conf /etc/smartdns/smartdns.conf