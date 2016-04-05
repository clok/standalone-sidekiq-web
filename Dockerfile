FROM ruby:alpine
MAINTAINER Derek Smith <drsmith.phys@gmail.com>

# Make ap dir
RUN mkdir -p /usr/src/sidekiq
WORKDIR /usr/src/sidekiq

# Copy Gemfile
COPY Gemfile /usr/src/sidekiq/
COPY Gemfile.lock /usr/src/sidekiq/

# Install sidekiq & rack
RUN bundle install

# Copy rackup file
COPY config.ru /usr/src/sidekiq/

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "config.ru"]
