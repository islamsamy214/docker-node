FROM node
# specify the working directory and this one to tell any coming command that you will ran in here
WORKDIR /app
# copy the package.json file to the working directory, BTW you can use COPY . . to copy all files and it will copy to the working directory but this is better to see where you are copying
# we copied this first to not run the npm install every time we change the code, because it will take from cache
COPY package.json /app
# install depedancies
RUN npm install
# copy the rest of files
COPY . /app
# here i will expose the 3000 because that what the app will run on in this case, and this before any CMD you want to excute and after the copy and RUN and this not mindatory but recommended
# we use this because it has it's own network
EXPOSE 3000
# it runs a commands like RUN but this one for the unrelated to the image and it will start the container
# this for RUNNING THE CONTAINER and it must be only one and in the last to be excuted
CMD ["node", "app.mjs"]