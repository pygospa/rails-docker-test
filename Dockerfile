FROM starefossen/ruby-node:2-8-stretch

# Best practice - order installs lexicographically with one install per line
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
&& gem install bundler \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /project

COPY Gemfile Gemfile.lock /project/

WORKDIR /project

RUN bundle install

COPY . /project
