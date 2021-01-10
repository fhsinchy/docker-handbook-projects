FROM node:lts-alpine as builder

WORKDIR /usr/app

COPY ./package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx:stable-alpine

EXPOSE 8080

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/app/dist /usr/share/nginx/html