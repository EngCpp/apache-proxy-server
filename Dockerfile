FROM ubuntu

MAINTAINER Carlos Eduardo <carlos@engcpp.com>	

RUN apt-get update && \
      apt-get -y install apache2

RUN a2enmod proxy
RUN a2enmod proxy_http 
RUN a2enmod proxy_html
RUN a2enmod proxy_connect
RUN a2enmod proxy_balancer
RUN a2enmod proxy_hcheck
RUN a2enmod proxy_fcgi
RUN a2enmod proxy_scgi
RUN a2enmod proxy_express
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod cache

COPY ./httpd.conf /etc/apache2/apache2.conf
COPY ./init.sh /use/sbin/init.sh

RUN chmod +x /use/sbin/init.sh

EXPOSE 8087

CMD /use/sbin/init.sh


