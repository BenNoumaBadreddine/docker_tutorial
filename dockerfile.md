# Dockerfile structure and syntax

### The base image
    FROM node:13-alpine
### Environmental variables
    ENV MONGO_DB_USERNAME=admin \
        MONGO_DB_PWD=password
### Create a folder under that directory inside of the container
    RUN mkdir -p /home/app

### copy from the local to the container. Copy the content of the 'app' folder to the '/home/app' directory.
    COPY ./app /home/app

### set default dir so that next commands executes in /home/app dir
    WORKDIR /home/app

### will execute npm install in /home/app because of WORKDIR
    RUN npm install

### no need for /home/app/server.js because of WORKDIR
    CMD ["node", "server.js"]

# How to build an image from a Dockerfile

    docker build -t app_name:app_tag location_of_the_Dockerfile
Example:

    docker build -t my-app:1.0 . 
Because we are in the same folder as the Dockerfile we just put '.' which means current directory.  