# the base image
FROM node:13-alpine

# The envirmental variables
ENV MONGO_DB_USERNAME=&{MONGO_DB_USERNAME} \
    MONGO_DB_PWD=&{MONGO_DB_PWD}

# Create a a folder under that directory inside of the container
RUN mkdir -p /home/app

# copy from the local to the container. Copy the content of the 'app' folder to the '/home/app' directory.
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

