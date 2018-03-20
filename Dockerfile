FROM cursor/mbase
MAINTAINER Ryan Pederson <ryan@pederson.ca>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && add-apt-repository -y ppa:vbernat/haproxy-1.8 \
  && apt-get update -q \
  && apt-get -y install haproxy=1.8.\* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /config

EXPOSE 443
EXPOSE 80
VOLUME /config

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
