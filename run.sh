#!/bin/bash
echo "Creating shared volume web-data"
echo ""
docker volume create --driver local web-data > /dev/null
echo ""
echo "Building Webapp1 image"
echo ""
docker build -f WebApp1.dockerfile -t webapp1 . > /dev/null
echo ""
echo "Building Webapp2 image"
echo ""
docker build -f WebApp2.dockerfile -t webapp2 . > /dev/null
echo ""
echo "Running  webApp1 in detached mode with user id 2000 and mounting the shared volume in /logFiles"
echo ""
docker run --rm -d --name web1 -u 2000:2000 --volume web-data:/logFiles webapp1 > /dev/null
echo ""
echo "Running  webApp2 linked to webApp1 in detached mode with user id 2000 and mounting the shared volume in /logFiles and Port 5002 mapped to host port 5002"
echo ""
docker run --rm -dp 5002:5002 --name web2 --link web1:web1 -u 2000:2000 --volume web-data:/logFiles webapp2 > /dev/null
echo "Doing the request to webApp2"
echo ""
sleep 2
docker exec -i web2 /bin/sh < test.sh

