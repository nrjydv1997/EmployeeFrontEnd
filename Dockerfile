FROM node:19.1.0-alpine as builder
RUN mkdir -p /app
WORKDIR /app
COPY . . 
RUN npm install -g npm@8.19.3
RUN npm build

FROM nginx:1.22.1-alpine
COPY src/nginx/etc/conf.d/default.conf /etc/nginx/conf/defult.conf
COPY --from=builder app/dist/employee-front-end usr/share/nginx/html
