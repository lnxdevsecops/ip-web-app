FROM rockylinux:8

RUN dnf install epel-release -y
RUN dnf install -y python3-pip httpd jq wget unzip net-tools dnsutils stress nc && pip3 install --upgrade awscli

# Copy the script to the container
COPY update_index.sh /usr/local/bin/update_index.sh

# Make the script executable
RUN chmod +x /usr/local/bin/update_index.sh

# Expose port 80
EXPOSE 80

# Run the script and start Apache
CMD ["/bin/bash", "-c", "/usr/local/bin/update_index.sh && httpd -D FOREGROUND"]
