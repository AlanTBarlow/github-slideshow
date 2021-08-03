FROM ruby:2.7-alpine

WORKDIR /usr/src/app/

EXPOSE 4000

RUN apk --update add --no-cache --virtual run-dependencies \
    bash \
    build-base \
    git

COPY Gemfile .

RUN bundle check || bundle install

COPY . .

WORKDIR /usr/src/app/docs

CMD bundle exec jekyll serve
