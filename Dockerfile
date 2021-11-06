FROM node:14
LABEL maintainer="dosunyun@vanillabrain.com"

ARG RELEASE=2.61.0

RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install groff rsync
RUN curl --silent --show-error --fail "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN curl --silent --show-error --fail "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest" -o "/usr/local/bin/ecs-cli"
RUN chmod +x /usr/local/bin/ecs-cli

RUN yarn global add serverless@${RELEASE}
RUN yarn global add @aws-amplify/cli

RUN npm install -g npm@7

WORKDIR /app
