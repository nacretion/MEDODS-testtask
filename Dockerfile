FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN dockerize --version
RUN wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz
RUN tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.6.1.tar.gz
RUN rm dockerize-linux-amd64-v0.6.1.tar.gz

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
