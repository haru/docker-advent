#!/bin/sh

if [ "$SECRET_KEY_BASE" = "" ]
then
  export SECRET_KEY_BASE=`rake secret`
fi

bundle exec rake db:migrate RAILS_ENV=production
bundle exec rails s -e production
