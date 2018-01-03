#!/usr/bin/env sh

# Refer to https://stackoverflow.com/questions/39089698/how-to-install-python-3-5-on-raspbian-jessie

sudo apt-get install build-essential libc6-dev
sudo apt-get install libncurses5-dev libncursesw5-dev libreadline6-dev
sudo apt-get install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
sudo apt-get install libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
cd $HOME
wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz
tar -zxvf Python-3.6.4.tgz
cd Python-3.6.4
./configure       # 3 min 13 s
# Let's use 4 threads
make -j4          # 8 min 29 s
sudo make install # ~ 4 min
cd ..
sudo rm -fr ./Python-3.6.4*
# upgrade:
sudo pip3 install -U pip
sudo pip3 install -U setuptools
