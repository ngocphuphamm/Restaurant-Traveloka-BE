FROM node:12.19.0-alpine as developer

WORKDIR /usr/src/app

COPY  package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3003
CMD ["npm", "start"]


