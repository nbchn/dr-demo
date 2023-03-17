#!/bin/bash

echo -e "\n==> Consume data from secondary - topic 2"
docker-compose exec broker-secondary kafka-console-consumer \
  --bootstrap-server localhost:19092 \
  --topic topic.dr.test.2 \
  --from-beginning
