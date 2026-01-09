#!/bin/bash

# Define the top root labs directory
NOTESDIR="/Users/karen2/latex/class/fos709/labs"
WEBDIR="/Users/karen2/latex/web/vanilla_site/class/fos709_web/"

# Define the subdirectory name you're looking for
SUBDIR="scripts"

# Loop through all directories in the current directory
for dir in $NOTESDIR/*/; do
    # Remove trailing slash from directory name
    dir=${dir%/}
    
    # Check if the subdirectory exists in this directory
    if [ -d "$dir/$SUBDIR" ]; then
        echo "Files in $dir/$SUBDIR:"
        
        # Loop through files in the subdirectory
        for file in "$dir/$SUBDIR"/*.R; do
            # Check if file exists (handles empty directories)
            if [ -e "$file" ]; then
                rsync -vtr "$file" $WEBDIR/R/script_bucket/;
                echo "  $(basename "$file")"
            fi
        done
        echo ""
    fi
done