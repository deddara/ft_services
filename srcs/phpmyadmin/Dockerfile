# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/15 13:30:00 by deddara           #+#    #+#              #
#    Updated: 2020/09/15 14:21:57 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk -U upgrade && apk add vim openrc openssl supervisor nginx  \
php7 php7-fpm php7-iconv php7-json php7-mbstring php7-mysqli php7-phar php7-session && rc-update add php-fpm7 default

COPY /srcs/nginx.conf /srcs/supervisord.conf /srcs/config.inc.php /
#installing phpmyadm

RUN wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz && mkdir -p /var/www/phpmyadmin /var/www/phpmyadmin/tmp \
&& chmod 777 /var/www/phpmyadmin/tmp && tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin



RUN rm -f /etc/nginx/conf.d/default.conf && mv /nginx.conf /etc/nginx/conf.d/ &&  \
mv /config.inc.php /var/www/phpmyadmin/ && mv /supervisord.conf /etc/supervisord.conf && mkdir /run/nginx /var/run/php

EXPOSE 5000

CMD	["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]