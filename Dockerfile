ARG ARCH=amd64
FROM ${ARCH}/debian:buster-slim
MAINTAINER amgxv
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /tmp
WORKDIR /tmp
RUN apt-get update && apt-get install -y wget make gcc
RUN wget https://github.com/pcherenkov/udpxy/archive/refs/tags/1.0-25.1.tar.gz
RUN tar -xzvf 1.0-25.1.tar.gz
RUN cd udpxy-1.0-25.1/chipmunk && make && make install
RUN apt-get autoremove wget make gcc -y && apt autoclean -y && rm -r /var/lib/apt/* && cd && rm 1.0-25.1.tar.gz && rm -rf udpxy-1.0-25.1/ 

CMD ["/usr/local/bin/udpxy", "-T", "-p", "4022"]

