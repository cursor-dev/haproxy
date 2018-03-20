#!/bin/bash

exec haproxy -f /config/haproxy.cfg -p /var/run/haproxy.pid
