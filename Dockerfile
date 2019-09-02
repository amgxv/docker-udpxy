ARG ARCH=amd64
FROM ${ARCH}/debian:buster-slim
MAINTAINER amgxv
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /tmp
WORKDIR /tmp
RUN apt-get update && apt-get install -y wget make gcc
RUN wget http://www.udpxy.com/download/udpxy/udpxy-src.tar.gz
RUN tar -xzvf udpxy-src.tar.gz
RUN cd udpxy-1.0.23-12 && make && make install
RUN apt-get autoremove wget make gcc -y && apt autoclean -y && rm -r /var/lib/apt/* && cd && rm udpxy-src.tar.gz && rm -rf udpxy-1.0.23.12/ 

CMD ["/usr/local/bin/udpxy", "-T", "-p", "4022"]

