FROM node:19.1.0-alpine AS builder
RUN mkdir -p /EmployeeFrontEnd
WORKDIR /EmployeeFrontEnd
COPY . .
RUN npm install -g npm@9.1.3
