FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y postgresql-client postgresql-contrib libpq-dev

RUN mkdir /medods
WORKDIR /medods

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

RUN service postgresql start && \
    su postgres -c "psql -c \"CREATE ROLE medods WITH LOGIN PASSWORD 'root';\"" && \
    su postgres -c "psql -c 'ALTER ROLE medods CREATEDB;'" && \
    su postgres -c "createdb -O medods myapp_development" && \
    su postgres -c "createdb -O medods myapp_test" && \
    service postgresql stop

CMD ["rails", "server", "-b", "0.0.0.0"]
