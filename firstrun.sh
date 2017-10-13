#!/bin/bash

if [ -f /godaddy-dyndns/godaddy-dyndns.py ]; then
  echo "godaddy-dyndns files already installed."
else
  echo "Installing godaddy-dyndns files."
  copy /etc/firstrun/godaddy-dyndns/* /godaddy-dyndns
fi