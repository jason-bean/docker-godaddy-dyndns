#!/bin/bash

source /config/project_env.sh

crontab -r
(crontab -l 2>/dev/null; echo $(printf "*/%s * * * * /godaddy-dyndns/godaddy-dyndns.sh /config" "${FREQ_MINUTES}")) | crontab -
