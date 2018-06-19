FROM ruby:2.5.1-alpine3.7

ADD Gemfile* /sidekiq/
ADD .env /sidekiq/

WORKDIR /sidekiq

RUN export $(cat .env | xargs) && bundle install

ADD config.ru /sidekiq/

EXPOSE 3333
ENTRYPOINT ["dotenv", "rackup", "config.ru"]
CMD ["-o", "0.0.0.0", "-p", "3333", "-q"]
