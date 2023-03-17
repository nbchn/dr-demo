#!/bin/bash

echo -e "\n==> list topic primary"
docker-compose exec broker-primary kafka-topics --list \
	--bootstrap-server broker-primary:19091
