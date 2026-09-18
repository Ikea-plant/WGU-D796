#!/bin/bash

# 1. Function to calculate file size in bytes
fileSize() {
    stat -c %s "$1"
}

TAR_GZ="/tmp/etc_backup.tar.gz"
TAR_BZ2="/tmp/etc_backup.tar.bz2"

# 2. Archive and compress /etc using tar + gzip
echo "Creating Gzip archive..."
sudo tar -czf "$TAR_GZ" /etc 2>/dev/null

# 3. Archive and compress /etc using tar + bzip2
echo "Creating Bzip2 archive..."
sudo tar -cjf "$TAR_BZ2" /etc 2>/dev/null

# 4. Calculate sizes
SIZE_GZ=$(fileSize "$TAR_GZ")
SIZE_BZ2=$(fileSize "$TAR_BZ2")

echo "Gzip file size:  $SIZE_GZ bytes"
echo "Bzip2 file size: $SIZE_BZ2 bytes"

# 5. Display difference
DIFF=$((SIZE_GZ - SIZE_BZ2))

if [ "$DIFF" -gt 0 ]; then
    echo "Bzip2 is smaller than Gzip by $DIFF bytes."
elif [ "$DIFF" -lt 0 ]; then
    ABS_DIFF=$((DIFF * -1))
    echo "Gzip is smaller than Bzip2 by $ABS_DIFF bytes."
else
    echo "Both compression methods produced the exact same file size."
fi