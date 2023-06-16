#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl
#Installing Docker
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
#Creating container
#Buildind image
sudo git clone https://github.com//hocine699/Hocine-Brief14
sudo docker build -t brief14:latest .

#Creating container
sudo docker run --name brief14 -p 1234:1234 -d brief14:latest

#Tag image and Push
sudo docker tag brief14:latest hocinho699/brief14:latest
sudo docker login -u hocinho699 -p dckr_pat_nbiFOyqT_WI2PC7pQ4HC946ta6s
sudo docker push hocinho699/brief-14-2:latest

