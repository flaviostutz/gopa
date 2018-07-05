FROM alpine:3.7

WORKDIR /gopa

RUN apk update &&\
    apk add wget tar

RUN wget https://github.com/infinitbyte/gopa-snapshot/releases/download/0.10.0/GOPA-0.10.0-368-linux64.tar.gz -O gopa.tar.gz

RUN tar vxzf gopa.tar.gz

EXPOSE 9001 8001 13001 8125 9223

CMD [ "/gopa/gopa-linux64" ]

