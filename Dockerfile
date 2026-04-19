FROM ruby:3.3.1

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
