#!/bin/bash

echo -e "\n==> Create topic on primary cluster"
docker-compose exec broker-primary kafka-topics  --create \
	--bootstrap-server broker-primary:19091 \
	--topic topic.dr.test.1 \
	--partitions 1 \
	--replication-factor 1 \
	--config min.insync.replicas=1

  docker-compose exec broker-primary kafka-topics  --create \
  	--bootstrap-server broker-primary:19091 \
  	--topic topic.dr.test.2 \
  	--partitions 1 \
  	--replication-factor 1 \
  	--config min.insync.replicas=1
