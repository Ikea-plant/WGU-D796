#!/bin/bash

# 1. Get initial free disk space in root partition (in KB)
INITIAL_FREE=$(df / --output=avail | tail -n 1)

# 2. Function to clean contents of a directory
cleanDir() {
    local TARGET_DIR="$1"
    if [ -d "$TARGET_DIR" ]; then
        echo "Cleaning directory: $TARGET_DIR"
        sudo rm -rf "${TARGET_DIR:?}"/*
    else
        echo "Directory $TARGET_DIR does not exist. Skipping."
    fi
}

# 3. List of target directories
LOG_DIRS=("/var/log" "$HOME/.cache")

# 4. Clean directories using a loop
for dir in "${LOG_DIRS[@]}"; do
    cleanDir "$dir"
done

# 5. Measure final free space and report difference
FINAL_FREE=$(df / --output=avail | tail -n 1)
FREED_SPACE=$((FINAL_FREE - INITIAL_FREE))

if [ "$FREED_SPACE" -gt 0 ]; then
    echo "Disk space freed: ${FREED_SPACE} KB"
else
    echo "No significant disk space was freed"
fi