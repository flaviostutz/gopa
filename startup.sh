#!/bin/bash
echo $ELASTICSEARCH_URL
if [ ! -f /initialized ]; then


   echo "Initializing gopa.yml parameters..."
   sed -i -e 's/<ELASTICSEARCH_SCHEME>/'"$ELASTICSEARCH_SCHEME"'/' /gopa/gopa.yml
   sed -i -e 's/<ELASTICSEARCH_HOST>/'"$ELASTICSEARCH_HOST"'/' /gopa/gopa.yml
   sed -i -e 's/<ELASTICSEARCH_PORT>/'"$ELASTICSEARCH_PORT"'/' /gopa/gopa.yml
   sed -i -e 's/<ELASTICSEARCH_USERNAME>/'"$ELASTICSEARCH_USERNAME"'/' /gopa/gopa.yml
   sed -i -e 's/<ELASTICSEARCH_PASSWORD>/'"$ELASTICSEARCH_PASSWORD"'/' /gopa/gopa.yml
   sed -i -e 's/<NUMBER_OF_CRAWLER_INSTANCES>/'"$NUMBER_OF_CRAWLER_INSTANCES"'/' /gopa/gopa.yml
   sed -i -e 's/<COOKIE_SECRET>/'"$COOKIE_SECRET"'/' /gopa/gopa.yml
   cat /gopa/gopa.yml
   echo "gopa.yml initialized"


   echo "Creating elasticsearch index..."
   sed -i -e 's/http/'"$ELASTICSEARCH_SCHEME"'/' /gopa/config/elasticsearch/gopa-index-mapping.sh
   sed -i -e 's/localhost/'"$ELASTICSEARCH_HOST"'/' /gopa/config/elasticsearch/gopa-index-mapping.sh
   sed -i -e 's/9200/'"$ELASTICSEARCH_PORT"'/' /gopa/config/elasticsearch/gopa-index-mapping.sh
   sed -i -e 's/elastic/'"$ELASTICSEARCH_USERNAME"'/' /gopa/config/elasticsearch/gopa-index-mapping.sh
   sed -i -e 's/changeme/'"$ELASTICSEARCH_PASSWORD"'/' /gopa/config/elasticsearch/gopa-index-mapping.sh
   sed -i -e 's/curl/curl --fail/' /gopa/config/elasticsearch/gopa-index-mapping.sh
   echo 'exit $?' >> /gopa/config/elasticsearch/gopa-index-mapping.sh

   while true; do
      echo "Trying to create elasticsearch index (maybe elasticsearch is not up yet)..."
      /gopa/config/elasticsearch/gopa-index-mapping.sh && break
      sleep 3
   done
   echo "index created"


   touch /initialized
   echo "INITIALIZATION DONE"
   echo

fi

echo "Starting GOPA..."
./gopa-linux64
