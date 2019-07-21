FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /rails_tutorial
WORKDIR /rails_tutorial
COPY Gemfile /rails_tutorial/Gemfile
COPY Gemfile.lock /rails_tutorial/Gemfile.lock
RUN bundle install
COPY . /rails_tutorial

