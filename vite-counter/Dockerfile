# first stage
FROM node as stage_one

WORKDIR /usr/app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# second stage
FROM nginx

COPY --from=stage_one /usr/app/dist /usr/share/nginx/html
