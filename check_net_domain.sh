#!/bin/bash

if ping -c 2 google.com > /dev/null 2>&1; then
    echo "Network is up."
else
    echo "Network is down."
fi