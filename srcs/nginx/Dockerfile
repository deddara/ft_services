# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 11:42:06 by deddara           #+#    #+#              #
#    Updated: 2020/09/11 12:46:03 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk -U upgrade && apk add openrc openssl openssh nginx vim bash

#SSL creating
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 30 -nodes -out /etc/ssl/private/deddara.crt \
	-keyout /etc/ssl/private/deddara.key -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=deddara/CN=deddara"

COPY ./srcs/nginx.conf ./srcs/index.html ./srcs/start.sh ./

RUN rm /etc/nginx/conf.d/default.conf && mv /nginx.conf /etc/nginx/conf.d/ && mv /index.html /var/www/ && mkdir /run/nginx

EXPOSE 22 80 443

CMD bash start.sh