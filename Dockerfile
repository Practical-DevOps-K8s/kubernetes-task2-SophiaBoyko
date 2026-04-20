FROM ruby:3.3.1-slim

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  pkg-config \
  nodejs \
  postgresql-client \
  libpq-dev \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]