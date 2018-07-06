FROM ubuntu:18.04 as BUILD
WORKDIR /gopa
RUN apt-get update &&\
    apt-get install -y tar wget
RUN wget https://github.com/infinitbyte/gopa/releases/download/v0.10.0/GOPA-0.10.0-linux64.tar.gz -O gopa.tar.gz
RUN tar vxzf gopa.tar.gz
RUN rm gopa.tar.gz


FROM golang:1.10
ENV ELASTICSEARCH_SCHEME http
ENV ELASTICSEARCH_HOST elasticsearch
ENV ELASTICSEARCH_PORT 9200
ENV ELASTICSEARCH_USERNAME admin
ENV ELASTICSEARCH_PASSWORD admin
ENV NUMBER_OF_CRAWLER_INSTANCES 5
ENV COOKIE_SECRET abc
WORKDIR /gopa
COPY --from=BUILD /gopa /gopa
ADD gopa.yml /gopa/
ADD startup.sh /gopa/startup.sh
RUN chmod +x /gopa/config/elasticsearch/gopa-index-mapping.sh
EXPOSE 9001 8001 13001 8125 9223

CMD [ "/gopa/startup.sh" ]
