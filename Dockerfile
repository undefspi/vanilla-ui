FROM node:8

ENV APP_ROOT=/opt/app-root \
    HOME=${APP_ROOT}/src \
    PATH=${HOME}/bin:/opt/app-root/bin:$PATH 

RUN echo ${APP_ROOT}

WORKDIR $HOME

RUN pwd

RUN ls -l ${HOME}
RUN ls -l /opt

RUN  useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin \
      -c "Default Application User" default && \
  chown -R 1001:0 $APP_ROOT

COPY package.json .
COPY public ./public
COPY src ./src
RUN ls -l

RUN npm install
RUN ls -l

RUN npm run build 
RUN ls -l

#RUN npm install -g serve
CMD ["npm", "start"]