#!/bin/bash

echo -e "\n==> Consume data from secondary - topic 1"
docker-compose exec broker-secondary kafka-console-consumer \
  --bootstrap-server localhost:19092 \
  --topic topic.dr.test.1 \
  --from-beginning
