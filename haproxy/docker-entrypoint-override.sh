#!/bin/sh
set -e

# exec haproxy entry poing script
exec /docker-entrypoint.sh "$@" &
exec rsyslogd -f /etc/haproxy/haproxy.conf &
#exec /usr/sbin/syslogd -p=/proc/self/fd/1 &
# start keepalived
exec /keepalived/start-keepalived.sh

