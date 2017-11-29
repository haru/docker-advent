#!/bin/sh
set -e

if [ "$SECRET_KEY_BASE" = "" ]
then
  export SECRET_KEY_BASE=`rake secret`
fi

mkdir -p /var/radvent_data/uploads

rm -f /usr/local/radvent/tmp/pids/server.pid
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rails s -e production
