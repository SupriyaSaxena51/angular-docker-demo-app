FROM  node:14.15.0-alpine as builder
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM nginx:1.17.10-alpine
EXPOSE 80
COPY --from=builder /app/dist/angular-docker-demo-app  /ur/share/nginx/html