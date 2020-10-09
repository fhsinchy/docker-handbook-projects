FROM node:lts

EXPOSE 3000

ENV NODE_ENV=production

WORKDIR /usr/app

COPY ./package.json .
RUN npm install --only=prod

COPY . .

USER node

CMD [ "node", "bin/www" ]