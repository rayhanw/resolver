FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install foreman
RUN bundle install

ENTRYPOINT ["./bin/entrypoint.sh"]

EXPOSE 3000
