#!/bin/bash

echo -e "\n==> List cluster links"
docker-compose exec broker-primary kafka-cluster-links \
	--bootstrap-server broker-secondary:19092 \
	--list
