#!/bin/bash

echo "=========================================="
echo "DEMONSTRATION 1: Run script without arguments"
echo "=========================================="
# Expecting an error message
./create_user.sh

echo -e "\n=========================================="
echo "DEMONSTRATION 2: Run script with valid arguments"
echo "=========================================="
# Runs the creation script with a valid username
./create_user.sh testuser

echo -e "\n=========================================="
echo "DEMONSTRATION 3: Switch user and force password change"
echo "=========================================="
# Forces a switch to 'testuser'.
# The user will be prompted to enter the password set in step 2
# and will immediately be forced to change it upon login.
su - testuser