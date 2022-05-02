From centos:latest
MAINTAINER hemantindia500@gmail.com
RUN yum install -y httpd
RUN yum install -y zip
Run yum install -y unzip
COPY magazine.zip /var/www/html
WORKDIR /var/www/html/
RUN unzip magazine.zip
RUN cp -rv magazine/* .
RUN rm -rf magazine.zip magazine
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
