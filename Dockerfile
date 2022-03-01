FROM ruby:3.1.1

ENV RAILS_ENV production
ENV SECRET_KEY_BASE a7738a2817e67a728a64bf15b0db00cf01ea3add8178557a2c21b271e9e7ef3c433dccd261fe449f0459f744cfc244fd4ae2ad6b8c927f0fb99643e5a9aeecb5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY . /app/

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

ENTRYPOINT ["bin/rails"]
CMD ["server", "-b", "0.0.0.0", "-e", "production"]

EXPOSE 3000
