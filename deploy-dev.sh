#!/bin/sh
#Deploy XNAT's dev site
docker-compose build xnat-dev
docker-compose up --no-deps -d xnat-dev