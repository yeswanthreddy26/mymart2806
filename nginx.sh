#!/bin/bash

cd /var/lib/jenkins/workspace/mymart

sudo cp -rf nginx.conf /etc/nginx/sites-available/
sudo rm /etc/nginx/sites-enabled/nginx.conf
sudo ln -s /etc/nginx/sites-available/ /etc/nginx/sites-enabled/nginx.conf
chmod 710 /var/lib/jenkins/workspace/mymart 

sudo sed -i 's/80 default_server/81 default_server/g' /etc/nginx/sites-enabled/default
sudo systemctl reload nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx has been started"

sudo systemctl status nginx
