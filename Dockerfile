FROM node:8

WORKDIR /home/nodejs/app

COPY package.json .
COPY public ./public
COPY src ./src
RUN ls -l

RUN npm install
RUN ls -l

RUN npm run build 
RUN ls -l

RUN npm install serve
CMD ["serve", "-s", "build"]