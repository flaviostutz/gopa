#FROM golang:1.10
FROM alpine:3.7

WORKDIR /gopa

#RUN apt-get update &&\
#    apt-get install git make
RUN apk update &&\
    apk add wget tar git

#RUN wget https://github.com/infinitbyte/gopa-snapshot/archive/0.11.0_SNAPSHOT.tar.gz -O source.tar.gz
#RUN git clone https://github.com/infinitbyte/gopa.git &&\
#    cd gopa &&\
#    git checkout v0.10.0

#RUN go get -u github.com/golang/dep/cmd/dep
#RUN dep ensure --add github.com/infinitbyte/gopa.git@v0.10.0
#RUN go get -v github.com/infinitbyte/gopa
#RUN make all

#RUN wget https://github.com/infinitbyte/gopa/releases/download/v0.10.0/GOPA-0.10.0-darwin64.tar.gz -O gopa.tar.gz
RUN wget https://github.com/infinitbyte/gopa/releases/download/v0.10.0/GOPA-0.10.0-linux64.tar.gz -O gopa.tar.gz
RUN tar vxzf gopa.tar.gz

EXPOSE 9001 8001 13001 8125 9223

#CMD [ "/gopa/gopa-darwin64" ]
CMD [ "/gopa/gopa-linux64" ]

