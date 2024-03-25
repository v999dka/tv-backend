ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION as base

# Set production environment
# ENV RAILS_ENV="production" \
#    BUNDLE_DEPLOYMENT="1" \
#    BUNDLE_PATH="/usr/local/bundle" \
#    BUNDLE_WITHOUT="development"

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config


RUN mkdir -p /opt/tvbackend
COPY . /opt/tvbackend
WORKDIR /opt/tvbackend
RUN chmod +x ./bin/docker-entrypoint

RUN bundle install

ENTRYPOINT ["./bin/docker-entrypoint"]

EXPOSE 1337
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "1337"]
