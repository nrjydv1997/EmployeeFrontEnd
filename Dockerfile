FROM node:19.1.0-alpine as angularwork
WORKDIR /myapp
COPY /package.json .
RUN npm install -g npm@8.19.3
COPY . .
RUN npm run build

FROM nginx:1.22.1-alpine
WORKDIR /usr/share/bginx/html
RUN rm -rf ./*
COPY /from=angularwork /myapp/build .
ENTRYPOINT ["nginx","-g","daemon off;"]
