FROM node:14-alpine

WORKDIR /app

COPY package.json ./

COPY yarn.lock ./

RUN apk update
RUN apk add git

RUN yarn install --frozen-lockfile

RUN npx browserslist@latest --update-db

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
