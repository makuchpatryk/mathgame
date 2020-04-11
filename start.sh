#!/usr/bin/env bash

# Helper script that basically starts dev server with some additional steps.


# compile once per 10 runs

if [ "$1" = "sass" ]
then
    echo "I am compiling, please wait"
    node node_modules/gulp/bin/gulp.js sass --production
fi

./manage.py collectstatic --clear --noinput
./manage.py compress
./manage.py collectstatic --noinput
if [ "$1" = "sitemap" ]
then
    echo "Refreshing sitemaps"
    ./manage.py refresh_sitemap
fi

# ./manage.py runserver_plus localhost:3000
./manage.py runserver
# if you want to serve static files when debug=false locally, run this: 
# ./manage.py runserver --insecure

