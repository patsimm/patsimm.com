FROM busybox

ADD index.html /www/index.html
ADD config.yml /www/config.yml

EXPOSE 80

# Create a basic webserver and sleep forever
CMD httpd -p 80 -h /www; tail -f /dev/null
