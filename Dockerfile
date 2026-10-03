FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl ca-certificates
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js

RUN npm install

EXPOSE 8000

ENTRYPOINT ["node", "main.js"]
