FROM node:8

WORKDIR /home/nodejs/app

COPY package.json .
COPY public .
RUN ls -l

RUN npm install
RUN ls -l

RUN npm build 
RUN ls -l

RUN npm install serve
CMD ["serve", "-s", "build"]