#!/bin/bash

FREQ_MINUTES=${FREQ_MINUTES}

crontab -r
(crontab -l 2>/dev/null; echo "*/$FREQ_MINUTES * * * * /godaddy-dyndns/godaddy-dyndns.sh /config") | crontab -
