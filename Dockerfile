FROM centos:latest

MAINTAINER Kihi

RUN set -x \
 && yum -y update \
 && yum -y install epel-release \
 && sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel*.repo \
 && yum -y install --enablerepo=epel nginx \
 && yum clean all

RUN set -x \
 && sed -i "/^http/i\env PHP_PORT_9000_TCP_ADDR;" /etc/nginx/nginx.conf \
 && sed -i "/^http/i\env PHP_PORT_9000_TCP_PORT;" /etc/nginx/nginx.conf \
 && sed -i "/^http/i\ " /etc/nginx/nginx.conf \
 && sed -i "/^http/a\ " /etc/nginx/nginx.conf \
 && sed -i "/^http/a\    perl_set \$env_php_port_9000_tcp_port 'sub { return \$ENV{\"PHP_PORT_9000_TCP_PORT\"}; }';" /etc/nginx/nginx.conf \
 && sed -i "/^http/a\    perl_set \$env_php_port_9000_tcp_addr 'sub { return \$ENV{\"PHP_PORT_9000_TCP_ADDR\"}; }';" /etc/nginx/nginx.conf

COPY ./php-fpm.conf /etc/nginx/default.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
