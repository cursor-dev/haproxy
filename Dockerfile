FROM cursor/mbase
MAINTAINER Ryan Pederson <ryan@pederson.ca>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update -q \
  && apt-get install -qy haproxy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /volumes/config

EXPOSE 443
EXPOSE 80
VOLUME /volumes/config

ADD start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
