docker exec -i web2 /bin/sh << EOF
cd logFiles/
ls
rm *
ls
EOF
docker stop web1 web2
