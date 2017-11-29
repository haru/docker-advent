#!/bin/sh
set -e

if [ "$SECRET_KEY_BASE" = "" ]
then
  export SECRET_KEY_BASE=`rake secret`
fi

mkdir -p /usr/local/radvent_data/uploads

bundle exec rake db:migrate RAILS_ENV=production
bundle exec rails s -e production
