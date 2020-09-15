# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 18:11:07 by deddara           #+#    #+#              #
#    Updated: 2020/09/15 14:59:10 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
RUN apk -U upgrade && apk add vim openrc mysql mysql-client

COPY /my.cnf ./etc/mysql/
COPY /start.sh /wordpress.sql ./

VOLUME	["sys/fs/cgroup"]
VOLUME	["/var/lib"]

EXPOSE 3306

ENTRYPOINT ./start.sh
