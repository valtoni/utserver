#!/bin/bash

sudo apt-get install lib32z1

sudo groupadd unreal
sudo useradd -m -s /bin/bash -g unreal unreal
sudo cp /etc/skel/.bashrc /home/unreal/
sudo cp /etc/skel/.profile /home/unreal/
sudo chown -R unreal:unreal /home/unreal

sudo su - unreal

wget http://ut-files.com/Entire_Server_Download/ut-server-436.tar.gz
tar -zxf ut-server-436.tar.gz
rm ut-server-436.tar.gz
cd ut-server
wget http://www.ut-files.com/Patches/UTPGPatch451LINUX.tar.tar # May be changed to .tar.bz2 by the admins soon
tar xfj UTPGPatch451LINUX.tar.tar
wget http://ut-files.com/Entire_Server_Download/server_scripts/asu-0.6.tar.gz
tar -zxf asu-0.6.tar.gz
chmod +x asu.sh
cd System
ln -s libSDL-1.1.so.0 libSDL-1.2.so.0
cd $HOME/ut-server

export UT_DATA_PATH="/workspaces/ubuntu/ut-server/System/"