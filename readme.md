# Bind9 Master/Caching DNS

### WIP

Creates a bare-bones Master/Caching domain name server container based on bind9 running on Alpine

### __Build__
___
```bash
$ docker build --tag bind9mc:latest .
```
### __Run__
___
```bash
$ docker run --detach --network host --restart unless-stopped --name bind9mc bind9mc:latest
```
### __Test__
___
*may need to install bind-utils for your distro*
```bash
$ dig @localhost jerra.io
```
Should get an output similar to this:
```
; <<>> DiG 9.11.13-RedHat-9.11.13-3.el8 <<>> @localhost jerra.io
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12399
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
; COOKIE: 326b064d235ee381010000005f7721774e3494b6d2224861 (good)
;; QUESTION SECTION:
;jerra.io.                      IN      A

;; AUTHORITY SECTION:
jerra.io.               3600    IN      SOA     ns01.jerra.io. root.jerra.io. 9 3600 900 86400 3600

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Fri Oct 02 22:47:51 AEST 2020
;; MSG SIZE  rcvd: 111
```
### __Purge__
___
```bash
$ docker kill bind9MC \
  && docker rm bind9mc \
  && docker rmi bind9mc:latest alpine:latest
```
### __(RTFM)__
___
This configuration stack was loosely generated from info found in 'DNS for Rocket Scientists':

Link: https://www.zytrax.com/books/dns/

This is a an extraordinarily good DNS resource IMO.

They have also written a book, 'Pro DNS and BIND' by Ronald (Ron) Aitchison.
