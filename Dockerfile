FROM ruby:2.4.2
LABEL maintainer="Haruyuki Iida"

RUN mkdir -p /usr/local

RUN git clone https://github.com/haru/radvent.git /usr/local/radvent
WORKDIR /usr/local/radvent

RUN bundle install --without test development

RUN apt-get update \
    && apt-get install -y nodejs --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN bundle exec rake radvent:generate_default_settings
RUN bundle exec rake assets:clean && bundle exec rake assets:precompile

EXPOSE 3000

CMD bundle exec rake db:migrate && bundle exec rails s start -e production