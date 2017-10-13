#!/bin/bash

if [ ! -f /config/godaddy-dyndns.conf.template ]; then
  echo "Copy template file."
  cp /godaddy-dyndns/godaddy-dyndns.conf.template /config
fi

printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export FREQ_MINUTES" > /config/project_env.sh
chmod +x /config/project_env.sh