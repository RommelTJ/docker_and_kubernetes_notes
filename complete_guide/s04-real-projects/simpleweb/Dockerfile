FROM node:alpine

WORKDIR /usr/app

# COPY package.json /usr/app/
COPY . .

RUN npm install

EXPOSE 8080

CMD ["npm", "start"]
