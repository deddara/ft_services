# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 18:11:07 by deddara           #+#    #+#              #
#    Updated: 2020/09/11 18:42:45 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
RUN apk -U upgrade && apk add vim openrc mysql mysql-client

COPY /db.cnf ./etc/mysql/

VOLUME	["sys/fs/cgroup"]
VOLUME	["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT	rc default && /etc/init.d/mariadb setup && /usr/bin/mysqld_safe