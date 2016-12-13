FROM centos:latest

MAINTAINER Kihi

RUN set -x \
 && yum -y update \
 && yum -y install epel-release \
 && sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel*.repo \
 && yum -y install --enablerepo=epel nginx \
 && yum clean all

COPY ./php-fpm.conf /etc/nginx/default.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
