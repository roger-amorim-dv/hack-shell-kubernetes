FROM ubuntu:latest
WORKDIR /workspace/app

# Install first dependencies
RUN apt-get update -y
RUN apt-get install file -y
RUN apt-get install curl -y

# Install dependencies
RUN apt-get -y install systemctl
RUN apt-cache search apache2
RUN apt-get install apache2 -y

# Add the script to the Docker Image
ADD execute.sh /workspace/app/execute.sh
ADD index.html /workspace/app/index.html

# Give execution rights on the cron scripts
RUN chmod +x /workspace/app/execute.sh

# Start webserver
RUN systemctl start apache2.service
RUN systemctl enable apache2.service
RUN cat /workspace/app/index.html > /var/www/html/index.html
RUN systemctl restart apache2.service
	
# Start container
EXPOSE 8080
ENTRYPOINT ["/workspace/app/execute.sh"]
