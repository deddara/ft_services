# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/16 13:57:17 by deddara           #+#    #+#              #
#    Updated: 2020/09/16 14:04:10 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk add ca-certificates

#adding library

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk \
&& apk add glibc-2.28-r0.apk

RUN wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
&&	tar -zxvf grafana-7.1.5.linux-amd64.tar.gz \
&&	rm -rf grafana-7.1.5.linux-amd64.tar.gz \
&&	mv /grafana-7.1.5 /grafana

EXPOSE	3000

WORKDIR	/grafana/bin/

ENTRYPOINT	./grafana-server