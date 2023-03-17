#!/bin/bash

echo -e "\n==> Describe consumer group in primary"
docker-compose exec broker-primary kafka-consumer-groups \
  --bootstrap-server localhost:19091 \
  --offsets \
  --all-groups \
  --describe
