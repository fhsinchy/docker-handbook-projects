FROM node:lts as base

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY ./package.json .
RUN npm install --only=prod

FROM node:lts-alpine

EXPOSE 3000

ENV NODE_ENV=production

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY . .
COPY --from=base /home/node/app/node_modules  /home/node/app/node_modules

CMD [ "node", "bin/www" ]