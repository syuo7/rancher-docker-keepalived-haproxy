FROM haproxy:1.7.9

ENV KEEPALIVED_VERSION 1:1.2.13-1
ENV HAPROXY_USER haproxy
RUN groupadd --system ${HAPROXY_USER} && \
  useradd --system --gid ${HAPROXY_USER} ${HAPROXY_USER} && \
  mkdir --parents /var/lib/${HAPROXY_USER} && \
  chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y keepalived=${KEEPALIVED_VERSION} && \
    apt-get install -y rsyslog && \
    rm -rf /var/lib/apt/lists/*
	
COPY docker-entrypoint-override.sh /
COPY keepalived /keepalived/
COPY haproxy.conf /etc/haproxy/haproxy.conf
RUN chmod +x /docker-entrypoint-override.sh
RUN chmod +x /keepalived/*.sh

ENTRYPOINT ["/docker-entrypoint-override.sh"]

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
