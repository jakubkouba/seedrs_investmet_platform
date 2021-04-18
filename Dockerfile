FROM ruby:2.6.3
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client && \
    gem install bundler:2.1.4
WORKDIR /seedrs
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]