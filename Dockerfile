FROM alpine:latest

#install dependencies for nmap installation
RUN apk add --update bzip2 && \
 apk add --update wget && \
 apk add  build-base && \
 apk add --update linux-headers

#Install Nmap
RUN wget https://nmap.org/dist/nmap-7.70.tar.bz2 && \
 bzip2 -cd nmap-7.70.tar.bz2 | tar xvf - && \ 
 cd nmap-7.70 && \
 ./configure && \
 make && \
 make install

ENTRYPOINT ["nmap"]
