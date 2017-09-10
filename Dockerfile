FROM busybox

ADD admin /www/admin

EXPOSE 80

# Create a basic webserver and sleep forever
CMD httpd -p 80 -h /www; tail -f /dev/null
