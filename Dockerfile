FROM alpine:latest as base

FROM base as build
RUN apk add --update

RUN apk add --no-cache tor
COPY keys/ /var/lib/tor/keys/
RUN chown -R tor /var/lib/tor/keys/
RUN chmod 700 /var/lib/tor/keys/
RUN echo "HiddenServiceDir /var/lib/tor/keys/" >> /etc/tor/torrc
RUN echo "HiddenServicePort 80 127.0.0.1:80" >> /etc/tor/torrc

RUN apk add --no-cache nginx
RUN mkdir -p /run/nginx
RUN mkdir -p /usr/share/nginx/www/
RUN chown -R nginx /run/nginx
COPY default.conf /etc/nginx/http.d/default.conf
# COPY www/ /usr/share/nginx/www/

RUN apk add --no-cache python3
RUN apk add --no-cache py3-pip
RUN pip3 install --upgrade pip
RUN adduser -D app
RUN mkdir -p /usr/src/app/backend/
RUN chown -R app /usr/src/app
COPY backend/ /usr/src/app/backend/
RUN pip3 install -r /usr/src/app/backend/requirements.txt
RUN python3 /usr/src/app/backend/manage.py collectstatic --noinput
RUN chown -R nginx /usr/share/nginx/www/
RUN python3 /usr/src/app/backend/manage.py migrate
# RUN python3 /usr/src/app/backend/manage.py loaddata /usr/src/app/backend/fixtures/initial_data.json

COPY start.sh /start.sh
RUN chmod +x start.sh

# What the container should run when it is started.
USER root

# During development
CMD ["/start.sh"]

# When ready to deploy
# ENTRYPOINT ["/start.sh"]