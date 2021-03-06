#!/bin/bash

sudo apt-get update -y 

# install docker
sudo curl https://releases.rancher.com/install-docker/17.03.sh | sh
sudo usermod -a -G docker admin

# create custom index.html
sudo mkdir -p /opt/bonial
sudo chown -r admin.admin /opt/bonial
echo "We are bonial.com, Let's shop with us." > /opt/bonial/index.html

# Run nginx container with custom html page.
sudo docker run --name bonial-nginx --restart=unless-stopped -v /opt/bonial:/usr/share/nginx/html:ro -d -p 8080:80 nginx
