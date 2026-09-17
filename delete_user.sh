#!/bin/bash

# 1. Verify argument is provided
if [ -z "$1" ]; then
    echo "Error: No username provided. Usage: $0 <username>" >&2
    exit 1
fi

USERNAME="$1"

# 2. Prompt for confirmation
read -p "Are you sure you want to delete user '$USERNAME' and their home directory? (y/N): " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "User deletion cancelled."
    exit 0
fi

# 3. Delete user and home directory
if id "$USERNAME" &>/dev/null; then
    # Check presence of username
    sudo useradd -r "$USERNAME"
    sudo userdel -r "$USERNAME"
    echo "User $USERNAME and their home directory have been deleted."
else
    echo "Error: User $USERNAME does not exist." >&2
    exit 1
fi

# 4. Display /etc/passwd to verify deletion
echo "--- Verifying /etc/passwd ---"
grep "^$USERNAME:" /etc/passwd || echo "User $USERNAME not found in /etc/passwd (Deletion confirmed)."