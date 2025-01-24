#!/bin/bash

# Get the list of all local Time Machine snapshots
snapshots=$(tmutil listlocalsnapshots / | grep 'com.apple.TimeMachine' | awk -F '.' '{print $(NF-1)}')

# Loop through each snapshot and delete it
for snapshot in $snapshots; do
    echo "Deleting snapshot: $snapshot"
    sudo tmutil deletelocalsnapshots "$snapshot"
done

echo "All local snapshots deleted."

