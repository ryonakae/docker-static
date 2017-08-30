#!/bin/sh

# backup wp-content/uploads
docker-compose run --rm data tar cvf /backup/data.tar /home
