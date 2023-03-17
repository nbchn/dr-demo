#!/bin/bash

echo -e "\n==> Create new topic on primary cluster"
docker-compose exec broker-primary kafka-topics  --create \
	--bootstrap-server broker-primary:19091 \
	--topic topic.dr.test.3 \
	--partitions 1 \
	--replication-factor 1 \
	--config min.insync.replicas=1

echo -e "\n==> Topic should be picked up by topic filter rule"

sleep 2

echo -e "\n==> Produce data on primary cluster - 1 -> 100"
docker-compose exec broker-primary bash -c 'seq 1 100 | kafka-console-producer \
    --broker-list broker-primary:19091 \
    --topic topic.dr.test.3'

sleep 2

echo -e "\n==> Consume data from primary cluster - 1 -> 100"
docker-compose exec broker-primary kafka-console-consumer \
  --bootstrap-server localhost:19091 \
  --topic topic.dr.test.3 \
  --from-beginning \
  --group dr-demo
