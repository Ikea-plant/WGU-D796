#!/bin/bash

if ping -c 2 8.8.8.8 > /dev/null 2>&1; then
    echo "Local machine can connect to Google DNS IP (8.8.8.8)."
else
    echo "Cannot connect to 8.8.8.8."
fi