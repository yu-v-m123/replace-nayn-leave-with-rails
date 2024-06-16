FROM ruby:3.3.1

ENV TZ Asia/Tokyo
ARG RUBYGEMS_VERSION=3.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential default-libmysqlclient-dev vim

RUN mkdir /api
WORKDIR /api

COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock

RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY . /api

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
