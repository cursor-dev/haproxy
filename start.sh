#!/bin/bash
/usr/bin/haproxy -c -q -f /volumes/config/haproxy.cfg
if [ $? -ne 0 ]; then
  echo "Errors found in configuration file, check it with 'haproxy check'."
  return 1
fi
