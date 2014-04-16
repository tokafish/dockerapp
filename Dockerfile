# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
# FROM phusion/passenger-full:<VERSION>
# Or, instead of the 'full' variant, use one of these:

FROM phusion/passenger-ruby21:0.9.9

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

### TODO

ADD . /home/app/
RUN chown -R 9999 /home/app

RUN mv /home/app/nginx.conf /etc/nginx/sites-enabled/webapp.conf
RUN rm -f /etc/service/nginx/down


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*