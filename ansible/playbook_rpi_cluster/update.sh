#!/bin/bash

# call an ansible playbook from bash
echo "Running Raspberry-Pi Cluster Playbook -- Updating Nodes"
pipenv run ansible-playbook --inventory-file inventory-cluster.ini playbook-update.yml -u root --ask-pass
