# Install base image that contains the os and installed env deps.
FROM node:latest

# Specify working directory in container
WORKDIR /usr/app

# Only copy package.json to make npm install work
COPY ./package.json ./

# Install project specific deps.
# Run npm i first before copying other files to the container
# to minimise cache busting
RUN npm i

# Copy file from project to container
# project path should be relative to build context(path when docker build command is issued)
COPY ./ ./


# Run project
CMD [ "npm", "start" ]