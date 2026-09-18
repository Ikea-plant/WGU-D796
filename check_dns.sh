#!/bin/bash

# Requires dnsutils package: sudo apt install dnsutils
if nslookup example.com > /dev/null 2>&1; then
    echo "DNS for example.com is working."
else
    echo "DNS resolution failed for example.com."
fi