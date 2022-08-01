FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
MAINTAINER hemantindia500@gmail.com
RUN yum install -y httpd
RUN yum install -y zip
RUN yum install -y zip
RUN yum install -y unzip
COPY magazine.zip /var/www/html
WORKDIR /var/www/html/
RUN unzip magazine.zip
RUN cp -rv magazine/* .
RUN rm -rf magazine.zip magazine
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
