FROM node:lts-alpine as builder

RUN apk add --no-cache python make g++

WORKDIR /app

COPY ./package.json .
RUN npm install --only=prod

FROM node:lts-alpine

EXPOSE 3000

ENV NODE_ENV=production

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY . .
COPY --from=builder /home/node/app/node_modules  /home/node/app/node_modules

CMD [ "node", "bin/www" ]