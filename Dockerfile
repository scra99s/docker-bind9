FROM alpine:latest

# Install bind
# Create bind directory structure
# Download latest root name servers list, needed to initialize cache of Internet domain name servers
RUN apk add --update --no-cache bind curl \
  && mkdir -p /opt/bind/etc /opt/bind/run /opt/bind/log /opt/bind/zones \
  && curl http://www.internic.net/domain/named.root -o /opt/bind/etc/root.servers

# Install configuration files
COPY build/named.conf build/entrypoint.sh /opt/bind/
COPY build/acls.conf build/options.conf build/zones.conf build/logging.conf /opt/bind/etc/
COPY build/localhost.rev build/localhost.fwd build/jerra.io.fwd build/jerra.io.rev build/blocked.fwd /opt/bind/zones/

RUN chmod +x /opt/bind/entrypoint.sh

EXPOSE 53/udp 53/tcp

WORKDIR /opt/bind/

CMD /bin/sh entrypoint.sh
