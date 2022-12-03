FROM node:19.1.0-alpine AS builder
WORKDIR /EmployeeFrontEnd
COPY . .
RUN npm i
RUN npm run builder

FROM nginx:1.22.1-alpine
COPY --from=builder /EmployeeFrontEnd/dist/EmployeeFrontEnd/ /usr/share/nginx/html
