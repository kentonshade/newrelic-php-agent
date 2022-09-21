#!/bin/bash

# Need to determine the best way to manage users on the instance
sleep 5

# Approach 2:
# Check for  non-interactive or other options for run.sh
# The -i flag is critical, this command should now work.
sudo -i -u ec2-user -H -b sh -c "cd /home/ec2-user/actions-runner; ./run.sh" 2>&1 | tee call-runner-output.txt

# We need to run command as hudson
# sudo -H -u hudson bash -c 'echo "I am $USER, with uid $UID"'
# sudo -H -u ec2-user bash -c '/home/ec2-user/actions-runner/run.sh'
sleep 10
# cd
# ./actions-runner/run.sh