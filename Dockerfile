FROM node:19.1.0-alpine AS builder
RUN mkdir -p /EmployeeFrontEnd
WORKDIR /EmployeeFrontEnd
COPY . .
RUN npm install -g npm@8.19.3
cmd ["npm","start"]

FROM nginx:1.22.1-alpine
COPY --from=builder /EmployeeFrontEnd/dist/EmployeeFrontEnd/ /usr/share/nginx/html
