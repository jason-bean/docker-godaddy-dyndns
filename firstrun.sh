#!/bin/bash

if [ ! -f /config/godaddy-dyndns.conf.template ]; then
  echo "Copy template file."
  cp /godaddy-dyndns/godaddy-dyndns.conf.template /config
fi
