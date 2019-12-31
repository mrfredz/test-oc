FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
LABEL maintainer="Chris <c@crccheck.com>"

ADD index.html /www/index.html

EXPOSE 8080
HEALTHCHECK CMD nc -z localhost 8080

# Create a basic webserver and run it until the container is stopped
CMD trap "exit 0;" TERM INT; httpd -p 8080 -h /www -f & wai
