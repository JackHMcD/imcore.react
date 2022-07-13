FROM node:14

WORKDIR /app

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Copy `yarn.lock` and all `package.json` files from the first build stage in
# preparation for `yarn install`.
COPY package.json package.json
COPY yarn.lock yarn.lock

# Install all dependencies and verify that `yarn.lock` will not be modified
# during the process. If `yarn.lock` needs to be modified, this step is
# deliberately designed to fail (Please refer to the article for the remedy.).
# This is to prevent `yarn.lock` from going out-of-sync with the `package.json`
# files inside each workspace, which can happen if npm is used as the package
# manager on the host side.
RUN yarn install --immutable --inline-builds

COPY . .

EXPOSE 3000

CMD ["npm", "start"]

