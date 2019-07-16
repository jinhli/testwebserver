FROM registry.redhat.io/ubi8/ubi
#FROM registry.access.redhat.com/ubi7

LABEL name="testwebserver" \
      vendor="Example Inc" \
      version="1.0" \
      release="1" \
      run='docker run -d -p 8080:80 --name=testweb testwebserver' \
      summary="Example Starter app" \
      description="Starter app will do ....."

COPY licenses /licenses

#RUN yum update -y
RUN yum install httpd -y

RUN echo "This container image was build on:" > /var/www/html/index.html
RUN date >> /var/www/html/index.html
EXPOSE 8080

# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
