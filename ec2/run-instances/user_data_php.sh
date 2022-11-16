#!/bin/bash

# Secrets

# Need to determine the best way to manage users on the instance
sleep 5


sudo -i -u hudson -H -b bash << EOF
sudo yum install -y jq

# We need to add these to .bashrc and then source
echo "export GH_TOKEN=${GH_TOKEN}" >> ~/.bashrc
echo "export RUNNER_NAME=${RUNNER_NAME}" >> ~/.bashrc
echo "export OWNER=${OWNER}" >> ~/.bashrc
echo "export REPO=${REPO}" >> ~/.bashrc
source ~/.bashrc
EOF

# This must be created on the AMI
sudo -i -u hudson "/home/hudson/runner-test-php.sh"
sleep 10
