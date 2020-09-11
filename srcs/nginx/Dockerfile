# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 11:42:06 by deddara           #+#    #+#              #
#    Updated: 2020/09/11 17:59:45 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

#copying source files
COPY ./srcs/nginx.conf ./srcs/index.html ./srcs/start.sh supervisord.conf ./

#installing main programs
RUN apk -U upgrade && apk add openrc openssl openssh nginx vim bash

#SSL creating
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 30 -nodes -out /etc/ssl/private/deddara.crt \
	-keyout /etc/ssl/private/deddara.key -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=deddara/CN=deddara"

#adding user for ssh
RUN adduser -D deddara && echo 'deddara:123' | chpasswd && addgroup user wheel && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
&& /usr/bin/ssh-keygen -A

#deleting and config files
RUN rm /etc/nginx/conf.d/default.conf && mv /nginx.conf /etc/nginx/conf.d/ \
&& mv /index.html /var/www/ \
&& mkdir /run/nginx /var/run/sshd /etc/supervisor.d && mv /supervisord.conf /etc/supervisor.d/

#listening ports
EXPOSE 22 80 443

#launch server
CMD bash start.sh