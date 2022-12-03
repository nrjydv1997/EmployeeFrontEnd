FROM node:19.1.0-alpine AS builder
WORKDIR /EmployeeFrontEnd
COPY . .
RUN npm install
