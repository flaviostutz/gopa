#!/bin/bash
echo $ELASTICSEARCH_URL
if [ ! -f /initialized ]; then
    echo "Initializing gopa.yml parameters"
    sed -i -e 's/<ELASTICSEARCH_SCHEME>/'"$ELASTICSEARCH_SCHEME"'/' /gopa/gopa.yml
    sed -i -e 's/<ELASTICSEARCH_HOST>/'"$ELASTICSEARCH_HOST"'/' /gopa/gopa.yml
    sed -i -e 's/<ELASTICSEARCH_PORT>/'"$ELASTICSEARCH_PORT"'/' /gopa/gopa.yml
    sed -i -e 's/<ELASTICSEARCH_USERNAME>/'"$ELASTICSEARCH_USERNAME"'/' /gopa/gopa.yml
    sed -i -e 's/<ELASTICSEARCH_PASSWORD>/'"$ELASTICSEARCH_PASSWORD"'/' /gopa/gopa.yml
    cat /gopa/gopa.yml
    touch /initialized
    echo "done"
    echo
fi

echo "Starting GOPA..."
./gopa-linux64
