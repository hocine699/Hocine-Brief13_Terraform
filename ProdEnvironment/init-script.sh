#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl
#Installing Docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#Creating container
sudo docker run -d -p 80:1234 --name brief14 hocinho699/brief-14
