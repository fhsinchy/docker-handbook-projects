FROM node:lts

EXPOSE 3000

ENV NODE_ENV=production

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY ./package.json .
RUN npm install --only=prod

COPY . .

CMD [ "node", "bin/www" ]