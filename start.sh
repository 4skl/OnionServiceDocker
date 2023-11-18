#!/bin/sh
# Start tor as tor user and then switch back to root
su -s /bin/sh -c 'tor &' tor

# Start nginx as nginx user and then switch back to root
su -s /bin/sh -c 'nginx -g "daemon off;"' nginx
su -s /bin/sh -c 'nginx -s reload' nginx

su -s /bin/sh -c 'cd /usr/src/app/backend/ && gunicorn backend.wsgi:application -b 0.0.0.0:8000 &>> log.txt &' app
# todo perhaps use supervidord ur runit to start both services