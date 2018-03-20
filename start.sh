#!/bin/bash

exec /usr/sbin/haproxy -f /config/haproxy.cfg -p /var/run/haproxy.pid
