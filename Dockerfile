FROM node:8

ENV APP_ROOT=/opt/app-root 
ENV HOME=${APP_ROOT}/src
ENV PATH=${HOME}/bin:/opt/app-root/bin:$PATH 

RUN echo ${APP_ROOT}

WORKDIR $HOME

COPY package.json .
COPY public ./public
COPY src ./src
RUN ls -l

RUN npm install
RUN ls -l

RUN npm run build 
RUN ls -l

RUN  useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin \
      -c "Default Application User" default && \
     chown -R 1001:0 ${APP_ROOT} && chmod -R ug+rwx ${APP_ROOT}

RUN ls -l /opt
RUN ls -l ${APP_ROOT}
RUN ls -l ${HOME}

RUN npm install serve

USER 1001

CMD ["serve","-s","./build"]