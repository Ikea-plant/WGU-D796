#!/bin/bash

# Make script executable
chmod +x create_user.sh

# Test 1, run script without any arguments
# Expecting an error message
./create_user.sh

# Test 2. Run script with valid argument
# Runs the creation script with a valid username
./create_user.sh testuser

# Test 3. Switch user and force password change
# Forces a switch to 'testuser'.
# The user will be prompted to enter the password set in step 2
# and will immediately be forced to change it upon login.
su - testuser