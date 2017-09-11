FROM alpine:3.6

RUN mkdir -p /var/www
WORKDIR /var/www

ADD . /var/www

RUN apk add --no-cache build-base libffi-dev ruby-dev ruby-rdoc ruby-irb ruby \
  nginx && mv nginx.conf /etc/nginx/nginx.conf
RUN gem install jekyll bundler

RUN bundle install
RUN jekyll build

CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
