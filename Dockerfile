FROM node:8

WORKDIR /home/nodejs/app

COPY . .

RUN npm install

RUN npm run build