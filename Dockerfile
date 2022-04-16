# FROM node:slim
FROM nginx:latest

# musl-dev is required for the node-sass binary from https://github.com/sass/node-sass/issues/1589
RUN apt update
RUN apt upgrade -y 
RUN apt install npm -y

# Setup dirs
WORKDIR /app
COPY ./ /app
RUN mv nginx/nginx.conf /etc/nginx/conf.d/default.conf

# RUN npm install
RUN npm install -g gulp
RUN npm install gulp
RUN chown nginx:nginx /app/*

# WebPorts
EXPOSE 8080

# COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/app/docker-entrypoint.sh"]
