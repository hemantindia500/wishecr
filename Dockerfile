From ubuntu:latest
MAINTAINER hemantindia500@gmail.com
RUN yum install -y httpd \
zip\
unzip
COPY magazine.zip /var/www/html
WORKDIR /var/www/html/
RUN unzip magazine.zip
RUN cp -rv magazine/* .
RUN rm -rf magazine.zip magazine
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
