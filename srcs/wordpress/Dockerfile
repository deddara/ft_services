# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 14:54:20 by deddara           #+#    #+#              #
#    Updated: 2020/09/15 17:25:28 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

#simple installing
RUN apk add nginx openrc supervisor \
vim php7 php7-fpm php7-json php7-mysqli mysql mysql-client wget \
&& rm /etc/nginx/conf.d/default.conf && rc-update add php-fpm7 default

#downloading wordpress and creating needed directories

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xf latest.tar.gz && rm -rf latest.tar.gz && mv wordpress /var/www/wordpress && chmod 777 /var/www/* && chmod 777 /var/www/wordpress/* \
&& mkdir -p /run/nginx && mkdir -p /run/php

# COPY srcs/wp-config.php /var/www/deddara/wordpress


#nginx configure
COPY srcs/nginx.conf /etc/nginx/conf.d/
COPY	srcs/supervisord.conf	/etc/supervisord.conf
COPY srcs/wp-config.php /var/www/wordpress
# #database creation
# COPY srcs/database_creation.sh /var/
# RUN bash /var/database_creation.sh

EXPOSE 5050

#server starter
CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
