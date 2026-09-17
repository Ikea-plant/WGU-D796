#!/bin/bash

# Make script executable
chmod +x delete_user.sh

# Test 1: Run without arguments
./delete_user.sh

# Test 2: Run with valid argument
./delete_user.sh testuser

# Test 3: Attempt to switch to deleted user
su - testuser