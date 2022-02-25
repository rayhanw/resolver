FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

CMD ["rails", "s", "-b", "0.0.0.0"]

EXPOSE 3000
