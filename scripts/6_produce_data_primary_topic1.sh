#!/bin/bash

echo -e "\n==> Produce data to primary - topic 1"
docker-compose exec broker-primary kafka-console-producer \
  --bootstrap-server localhost:19091 \
  --topic topic.dr.test.1
