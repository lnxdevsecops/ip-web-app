#!/bin/bash

# Get the hostname of the server
hostname=$(hostname)

# Get the Private IP address of the server
pvt_ip_addr=$(hostname -I | awk '{print $1}')

# Get the Public IP Address of the server.
pub_ip_addr=$(curl -4 --silent  ipconfig.io)

# Display the hostname and IP address
#echo "Hostname: $hostname"
#echo "IP Address: $ip_address"

echo "<h1>Hostname:  $hostname <h1>" > /var/www/html/index.html
echo "<h1>Public IP Address: $pub_ip_addr </h1>"  >> /var/www/html/index.html
echo "<h1>Private IP  Address: $pvt_ip_addr </h1>" >> /var/www/html/index.html
