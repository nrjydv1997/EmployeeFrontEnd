FROM node:19.1.0-alpine AS builder
WORKDIR /employeefrontend
COPY . .
RUN npm install -g npm@8.19.3
cmd ["npm","build"]

FROM nginx:1.22.1-alpine
COPY --from=builder /employeefrontend/dist/employee-front-end/ /usr/share/nginx/html
