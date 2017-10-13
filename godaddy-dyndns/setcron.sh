#!/bin/bash

CRONTAB_ENTRY=$(printf "*/%s * * * * /godaddy-dyndns/godaddy-dyndns.sh /config" "${FREQ_MINUTES}")

#crontab -r
(crontab -l 2>/dev/null; echo "$CRONTAB_ENTRY") | crontab -
