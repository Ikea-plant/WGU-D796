#!/bin/bash

echo "Starting system update at $(date)" > update.log
sudo apt update && sudo apt upgrade -y >> update.log 2>&1
echo "Update complete at $(date)" >> update.log