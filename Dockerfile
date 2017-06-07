FROM ubuntu:14.04.3

RUN apt-get update && \
	apt-get clean  && \
	apt-get install libnet1 libpcap0.8  && \
	apt-get clean  && \
	apt-get install -y libnet1-dev libpcap0.8-dev && \
	apt-get clean  && \
 apt-get install -y git squid nghttp2 && \
	apt-get clean  &&  \
     mkdir -m 777 /config 
 
ENV SERVER_CRT=none SERVER_KEY=none

ADD squid.conf     /config/squid.conf
ADD nghttpx.conf   /config/nghttpx.conf

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
RUN chmod +x /usr/local/bin/net_speeder

EXPOSE 3128

ADD entrypoint.sh /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
