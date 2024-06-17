#Importing base image
FROM apline:3.20 
#Updating dependencies and installing curl and jq
RUN apk update && apk upgrade && apk add curl jq
#Creating new user
RUN adduser -h /home/GHA -s /bin/sh -u 1000 -G users -D GHA
#Switching to new user
USER GHA
#Downloading and extracting the runner, then removing the tar file
RUN curl -O -L https://github.com/actions/runner/releases/latest/download/actions-runner-linux-x64-latest.tar.gz \
&& tar xzf actions-runner-linux-x64-latest.tar.gz \
&& rm actions-runner-linux-x64-latest.tar.gz
#
