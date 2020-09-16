# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deddara <deddara@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/16 12:02:43 by deddara           #+#    #+#              #
#    Updated: 2020/09/16 12:41:24 by deddara          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk add supervisor && rm -rf /var/cache/apk/*

#adding library

wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk \
&& apk add glibc-2.28-r0.apk

#influx and telegraf adding

RUN		wget https://s3.amazonaws.com/influxdb/influxdb-static-nightly_linux_amd64.tar.gz
&& mkdir -p /app /var/lib/influxdb/ && \
&& tar xfz influxdb-static-nightly_linux_amd64.tar.gz -C /app && \
&& rm influxdb-static-nightly_linux_amd64.tar.gz \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
&& tar xf telegraf-1.15.2_linux_amd64.tar.gz

RUN		cd telegraf-1.15.2/usr/bin && ./telegraf -sample-config --input-filter docker --output-filter influxdb > telegraf.conf

COPY	srcs/supervisord.conf	/etc/supervisord.conf

VOLUME	["/var/lib"]
EXPOSE 8086

CMD		["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
