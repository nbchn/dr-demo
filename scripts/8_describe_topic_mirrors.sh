#!/bin/bash

echo -e "\n==> Describe topic mirrors"
docker-compose exec broker-secondary kafka-mirrors \
  --bootstrap-server localhost:19092 \
  --describe
