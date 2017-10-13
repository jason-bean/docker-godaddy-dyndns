#!/bin/bash

if [ -f /godaddy-dyndns/godaddy-dyndns.py ]; then
  echo "godaddy-dyndns files already installed."
else
  echo "Installing godaddy-dyndns files."
  cp /etc/firstrun/godaddy-dyndns/* /godaddy-dyndns
  cd /godaddy-dyndns
  mkdir venv
  python3 -m venv venv
fi