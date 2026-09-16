#!/bin/bash

# 1. Verify username argument is provided
if [ -z "$1" ]; then
    echo "Error: No username provided. Usage: $0 <username>" >&2
    exit 1
fi

USERNAME="$1"

# 2. Check if group "dev_group" exists; if not, create it
if ! getent group dev_group > /dev/null 2>&1; then
    sudo groupadd dev_group
    echo "Group 'dev_group' created."
fi

# 3. Add user with home directory, dev_group, and set password
sudo useradd -m -g dev_group -s /bin/bash "$USERNAME"

echo "Setting password for $USERNAME:"
sudo passwd "$USERNAME"

# Force password change on first login
sudo chage -d 0 "$USERNAME"

# 4. Display /etc/passwd to verify user creation
echo "--- Verifying user in /etc/passwd ---"
grep "^$USERNAME:" /etc/passwd

echo "User $USERNAME created successfully."