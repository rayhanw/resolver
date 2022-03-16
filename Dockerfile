FROM ruby:3.1.1

ENV RAILS_ENV production

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY . /app/

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

RUN rails bin/rails assets:precompile && bin/rails assets:clean

ENTRYPOINT ["bin/rails"]
CMD ["server", "-b", "0.0.0.0", "-e", "production"]

EXPOSE 3000
