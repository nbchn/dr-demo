#!/bin/bash

echo -e "\n==> Consume data from secondary - topic 2"
docker-compose exec broker-primary kafka-console-consumer \
  --bootstrap-server localhost:19091 \
  --topic topic.dr.test.2 \
  --from-beginning \
  --group my-cg-1
