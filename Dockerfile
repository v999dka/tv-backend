ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION as base
ENV RAILS_ENV="development"

# Set production environment
# ENV RAILS_ENV="production" \
#    BUNDLE_DEPLOYMENT="1" \
#    BUNDLE_PATH="/usr/local/bundle" \
#    BUNDLE_WITHOUT="development"

FROM base as build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config

COPY ./bin/docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint

RUN mkdir -p /opt/tvbackend
COPY . /opt/tvbackend
WORKDIR /opt/tvbackend

RUN bundle exec bootsnap precompile app/ lib/

ENTRYPOINT ["/usr/bin/docker-entrypoint"]

EXPOSE 1337
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "1337"]
