#!/bin/bash

docker build -t vitortoledo .
docker stop vitortoledo
docker run -d --rm -p 8000:8000 \
       --env-file $HOME/vitortoledo.env \
       --name vitortoledo \
       -v $(pwd)/dkdata:/dkdata \
       vitortoledo start.sh