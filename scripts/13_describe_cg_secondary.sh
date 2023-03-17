#!/bin/bash

echo -e "\n==> Describe consumer group in secondary"
docker-compose exec broker-secondary kafka-consumer-groups \
  --bootstrap-server localhost:19092 \
  --offsets \
  --all-groups \
  --describe
