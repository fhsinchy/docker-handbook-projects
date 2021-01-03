FROM node:lts as builder

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY ./package.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx:stable

EXPOSE 80

COPY --from=builder /home/node/app/dist /usr/share/nginx/html
