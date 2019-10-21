FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ADD . /src

WORKDIR /src

ADD Gemfile /src/Gemfile
ADD Gemfile.lock /src/Gemfile.lock

RUN bundle install
