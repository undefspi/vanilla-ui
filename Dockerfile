FROM node:8

WORKDIR /home/nodejs/app

COPY package.json .
RUN npm install
RUN ls -l
RUN npm install serve
CMD ["serve", "-s", "build"]