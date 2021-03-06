FROM alpine:latest

LABEL maintainer="汪心禾 <wangxinhe06@gmail.com>"


RUN [ "apk", "add", "--no-cache", "apache2-mod-wsgi", "py3-pip", "npm", "git" ]

WORKDIR /var/www/localhost/wsgi-scripts/xyzzyy
COPY . .
RUN mv apache2.conf /etc/apache2/conf.d/xyzzyy.conf
RUN pip3 install --no-cache-dir -r requirements.txt
RUN npm i


EXPOSE 80

CMD [ "sh", "-c", "export PYTHONPATH=$(pwd) && /usr/sbin/httpd && /bin/sh" ]
