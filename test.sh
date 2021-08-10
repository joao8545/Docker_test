#!/bin/sh
cd logFiles/
echo""
echo "Origianl content of the file"
echo ""
if [[ -f "HelloWorld.txt" ]]
then
    cat HelloWorld.txt
else
    echo "No file "
    echo ""
fi
wget http://localhost:5002/hello > /dev/null
echo ""
echo "current content of log file"
echo ""
cat HelloWorld.txt
