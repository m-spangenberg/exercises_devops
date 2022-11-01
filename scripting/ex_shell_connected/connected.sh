#! /bin/bash

: "Scan all networks connected to local machine for active devices"

# Get all active networks and relevant subnets
ip a | grep -Eo  '([0-9]*\.){3}[0-9]*'