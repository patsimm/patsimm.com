FROM alpine:3.6

RUN mkdir -p /var/www
WORKDIR /var/www

RUN apk add --no-cache build-base libffi-dev ruby-dev ruby-rdoc ruby-irb ruby \
  nginx && gem install jekyll bundler

ADD . /var/www

RUN mv nginx.conf /etc/nginx/nginx.conf && bundle install && jekyll build

CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
