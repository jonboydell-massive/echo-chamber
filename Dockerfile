FROM node:8.9.1-alpine

RUN mkdir -p /usr/app
COPY package.json /usr/app/package.json
WORKDIR /usr/app
RUN apk --update add curl
RUN curl -o- -L https://yarnpkg.com/install.sh | sh
RUN yarn install
COPY server.js /usr/app/server.js

EXPOSE 3000

CMD ["npm", "start"]