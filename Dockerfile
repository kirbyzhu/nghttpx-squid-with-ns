FROM alpine:edge
# squid 3.5.23
# nghttp2 1.22
RUN  apk add --no-cache --update squid nghttp2 git gcc\
 &&  mkdir -m 777 /config 
 
ENV SERVER_CRT=none SERVER_KEY=none

ADD squid.conf     /config/squid.conf
ADD nghttpx.conf   /config/nghttpx.conf

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
RUN chmod +x /usr/local/bin/net_speeder

ADD entrypoint.sh /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
