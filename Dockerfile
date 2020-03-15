FROM node:12 
RUN . /etc/profile && \
  apk add --update curl bash sudo git && \
  mkdir -p /code
COPY package.json /tmp/package.json
RUN  cd /tmp && \
  npm config set registry https://registry.npmjs.com/ 
  npm install && \
  npm cache clean --force && \
  mkdir -p /code && \
  cp -a /tmp/node_modules/ /code && \
  rm -rf /tmp/node_modules
COPY . /code
WORKDIR /code
ENTRYPOINT ["node", "./script/start.js"]
