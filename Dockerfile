#--------------Development Environment------------>
# base image
FROM node:14.15.0-alpine as builder
# set working directory
WORKDIR /app
# install and cache app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install -g @angular/cli@9.1.15
RUN npm install
# add app
COPY . /app
# start app
CMD ng serve

#--------------Production Environment------------>
# FROM  node:14.15.0-alpine as builder
# COPY . /app
# WORKDIR /app
# RUN npm install
# RUN npm run build

# FROM nginx:1.17.10-alpine
# EXPOSE 80
# COPY --from=builder /app/dist/angular-docker-demo-app  /usr/share/nginx/html