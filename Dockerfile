# Pull the base image
FROM amd64/alpine:latest

Maintainer <Benny.Flash>

# Image Info
LABEL Platform="DSM"   \
	  Name="SmartDNS"  \
	  Ver="Release 30" 
	  
WORKDIR /

RUN wget https://github.com/pymumu/smartdns/releases/download/Release30/smartdns.1.2020.02.25-2212.x86_64-linux-all.tar.gz && \
  tar zxvf smartdns.*.tar.gz && \
  mv smartdns/src/smartdns /usr/sbin/smartdns  && \
  mv smartdns/etc/default/smartdns /etc/default/smartdns && \
  mv smartdns/etc/init.d/smartdns /etc/init.d/smartdns && \
  mv smartdns/systemd/smartdns.service /systemd/smartdns.service && \
  rm -rf smartdns*

COPY root/ /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["systemctl start smartdns"]