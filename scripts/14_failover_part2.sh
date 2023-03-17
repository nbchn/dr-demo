#!/bin/bash

echo -e "\n==> At this point we simulate a consumer failover"

echo -e "\n==> Produce data on primary cluster - 101 -> 200"
docker-compose exec broker-primary bash -c 'seq 101 200 | kafka-console-producer \
    --broker-list broker-primary:19091 \
    --topic topic.dr.test.3'

sleep 2

echo -e "\n==> Restart Consumer on secondary cluster - should start at 101"
docker-compose exec broker-secondary kafka-console-consumer \
  --bootstrap-server localhost:19092 \
  --topic topic.dr.test.3 \
  --group dr-demo

sleep 2

echo -e "\n==> At this point we simulate a producer failover"
echo -e "\n==> Promote topic on secondary cluster to make it writable"
docker-compose exec broker-secondary kafka-mirrors --promote \
	--topics topic.dr.test.3 \
	--bootstrap-server=localhost:19092

sleep 2

echo -e "\n==> Produce data on secondary cluster - 201 -> 300"
docker-compose exec broker-secondary bash -c 'seq 201 300 | kafka-console-producer \
    --broker-list broker-secondary:19092 \
    --topic topic.dr.test.3'


echo -e "\n==> Promoting force the synchronisation of the offsets so despite the fact that offet 200 was committed before it has be reset to 100"
echo -e "\n==> Consume on secondary cluster - should start at 101"
docker-compose exec broker-secondary kafka-console-consumer \
  --bootstrap-server localhost:19092 \
  --topic topic.dr.test.3 \
  --group dr-demo
