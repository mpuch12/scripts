#!/bin/bash

#1.wsl --install or wsl.exe --install
#2.pobrać ubuntu 20.04 LTS z microsoft store

#docker instalacja 
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

#może nadać do sudoers

#kubectl instalacja

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#instalacja skryptów
(
  cd /usr
  mkdir scripts
  cd scripts
  git clone https://github.com/atteo/uberbin.git
)

echo "PATH=$PATH:/usr/scripts/uberbin/" >> $HOME


#python3
#
