#!/bin/bash


if [ "$(id -u)" != "0" ]; then
	echo "Sudo privs needed for the tool installation " 
	exit 1
fi
if [ ! -f /usr/bin/scale ]; then
	echo "Scale not found. Installing. "
	wget -O- https://raw.githubusercontent.com/guillep/Scale/master/setupScale.sh | sudo bash
fi
echo "*********************************************"
echo "* cloning MakrosTool repository " 
echo "*********************************************"
git clone https://github.com/sbragagnolo/MakrosTool /tmp/MakrosTool 
cd /tmp/MakrosTool
echo "*********************************************"
echo "* building MakrosTool image  " 
echo "*********************************************"
./build/buildMakros.st
echo "*********************************************"
echo "* checking if there is any old installation " 
echo "*********************************************"
./build/uninstall.st
echo "*********************************************"
echo "* Copying files!  " 
echo "*********************************************"
./build/install.st
echo "*********************************************"
echo "* Cleaning the mess :)   " 
echo "*********************************************"
rm /tmp/MakrosTool -rf

