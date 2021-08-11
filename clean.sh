echo "removing files from volume"
docker exec -i web2 /bin/sh << EOF
cd logFiles/
ls
rm *
ls
EOF
echo "stoping containers"
docker stop web1 web2
echo "removing ghost images"
docker rmi $(docker images | gawk '{if($1 == "<none>" ) print $3 }')
