FROM node:19.1.0-alpine as builder
RUN mkdir -p /app
WORKDIR /app
COPY . . 
RUN npm install -g npm@8.19.3
RUN npm run

FROM nginx:1.22.1-alpine
COPY --from=builder app/dist/employee-front-end usr/share/nginx/html
