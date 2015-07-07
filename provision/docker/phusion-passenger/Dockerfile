# Create a postgresql docker file
FROM phusion/passenger-ruby22
MAINTAINER Frodo Larik <frodo@kabisa.nl>

# Ruby 2.2
RUN ruby-switch --set ruby2.2

# Make sure nginx starts
RUN rm -f /etc/service/nginx/down

# place correct vhosts
RUN rm /etc/nginx/sites-enabled/default
ADD ./vhost.conf /etc/nginx/sites-enabled/vhost.conf
RUN mkdir /home/app/webapp

# PostgreSQL environments
ADD ./postgresql-env.conf /etc/nginx/main.d/postgres-env.conf

# Rails environments
ADD ./rails-env.conf /etc/nginx/conf.d/rails-env.conf


# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
