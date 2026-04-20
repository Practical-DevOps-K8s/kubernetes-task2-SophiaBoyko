FROM ruby:3.3.1-slim

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs \
  postgresql-client \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
