#!/bin/bash


# echo -e "\n==> Create Cluster Link from primary to secondary"
# docker-compose exec broker-primary bash -c 'echo "{\"groupFilters\": [{\"name\": \"*\",\"patternType\": \"LITERAL\",\"filterType\": \"INCLUDE\"}]}" > groupFilters.json'
# docker-compose exec broker-primary bash -c 'echo "{\"topicFilters\": [{\"name\": \"*\",\"patternType\": \"LITERAL\",\"filterType\": \"INCLUDE\"}]}" > topicFilters.json'
# docker-compose exec broker-primary kafka-cluster-links \
# 	--bootstrap-server broker-secondary:19092 \
# 	--create \
# 	--link dr-link \
# 	--config bootstrap.servers=broker-primary:19091,consumer.offset.sync.enable=true,consumer.offset.sync.ms=10000,auto.create.mirror.topics.enable=true \
# 	--consumer-group-filters-json-file groupFilters.json \
#   --topic-filters-json-file topicFilters.json

  echo -e "\n==> Create Cluster Link from primary to secondary"
  docker-compose exec broker-primary bash -c 'echo "{\"groupFilters\": [{\"name\": \"*\",\"patternType\": \"LITERAL\",\"filterType\": \"INCLUDE\"}]}" > groupFilters.json'
  docker-compose exec broker-primary bash -c 'echo "{\"topicFilters\": [{\"name\": \"topic.dr.\",\"patternType\": \"PREFIXED\",\"filterType\": \"INCLUDE\"}]}" > topicFilters.json'
  docker-compose exec broker-primary kafka-cluster-links \
  	--bootstrap-server broker-secondary:19092 \
  	--create \
  	--link dr-link \
  	--config bootstrap.servers=broker-primary:19091,consumer.offset.sync.enable=true,consumer.offset.sync.ms=10000,auto.create.mirror.topics.enable=true \
  	--consumer-group-filters-json-file groupFilters.json \
    --topic-filters-json-file topicFilters.json
