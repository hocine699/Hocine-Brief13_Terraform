#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl
#Installing Docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#Creating container
#Buildind image

sudo docker run --name brief14 -p 1234:1234 -d hocinho699/brief14


