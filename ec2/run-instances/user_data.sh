#!/bin/bash

# Secrets

# Need to determine the best way to manage users on the instance
sleep 5


sudo -i -u ec2-user -H -b bash << EOF
sudo yum install -y jq

# We need to add these to .bashrc and then source
echo "export GH_TOKEN=${GH_TOKEN}" >> ~/.bashrc
echo "export RUNNER_NAME=${RUNNER_NAME}" >> ~/.bashrc
echo "export OWNER=${OWNER}" >> ~/.bashrc
echo "export REPO=${REPO}" >> ~/.bashrc
source ~/.bashrc
EOF

# This must be created on the AMI
sudo -i -u ec2-user "/home/ec2-user/runner-test.sh"
sleep 10