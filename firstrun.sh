#!/bin/bash

#if [ -f /godaddy-dyndns/godaddy-dyndns.py ]; then
#  echo "godaddy-dyndns files already installed."
#else
#  echo "Installing godaddy-dyndns files."
#  cp /etc/firstrun/godaddy-dyndns/* /godaddy-dyndns
#  cd /godaddy-dyndns
#  mkdir venv
#  python3 -m venv --system-site-packages venv
#fi

FREQ_MINUTES=${FREQ_MINUTES}

crontab -r
(crontab -l 2>/dev/null; echo "*/$FREQ_MINUTES * * * * /godaddy-dyndns/godaddy-dyndns.sh") | crontab -