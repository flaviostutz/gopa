# gopa
Gopa Docker Container. See more at https://github.com/infinitbyte/gopa

# Usage
docker-compose.yml

```
version: '3'
services:
  gopa:
    image: flaviostutz/gopa
    ports:
      - "9001:9001"
      - "8001:8001"
    environment:
      - ELASTICSEARCH_HOST=elasticsearch
      - ELASTICSEARCH_USERNAME=admin
      - ELASTICSEARCH_PASSWORD=admin

  elasticsearch:
    image: elasticsearch:5.6
    ports:
      - "9200:9200"
    volumes:
      - elasticsearch:/usr/share/elasticsearch/data

volumes:
  elasticsearch:
```

Try it at http://localhost:9100
