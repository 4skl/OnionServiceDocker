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
RUN mkdir -p /usr/share/nginx/html/
RUN chown -R nginx /run/nginx
COPY default.conf /etc/nginx/http.d/default.conf
RUN echo "Hello World" > /usr/share/nginx/html/index.html

COPY start.sh /start.sh
RUN chmod +x start.sh

# What the container should run when it is started.
USER root
# During development
CMD ["/start.sh"]

# When ready to deploy
# ENTRYPOINT ["/start.sh"]