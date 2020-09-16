# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/15 17:37:59 by deddara           #+#    #+#              #
#    Updated: 2020/09/16 11:35:28 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN		apk update && apk add openssl vsftpd openrc
	
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 30 -nodes -out /etc/vsftpd/vsftpd.pem \
	-keyout /etc/vsftpd/vsftpd.pem -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=deddara/CN=deddara" && echo 'root:root' | chpasswd \
&& mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog && rc default

VOLUME	["sys/fs/cgroup"]

EXPOSE 21

COPY	srcs/vsftpd.conf		/etc/vsftpd/vsftpd.conf

ENTRYPOINT	vsftpd /etc/vsftpd/vsftpd.conf