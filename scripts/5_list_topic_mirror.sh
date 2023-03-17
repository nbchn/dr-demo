#!/bin/bash

echo -e "\n==> List topic mirror"
docker-compose exec broker-secondary kafka-mirrors \
	--bootstrap-server broker-secondary:19092 \
	--list
