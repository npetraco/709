#!/bin/bash

# Define the subdirectory name you're looking for
SUBDIR="scripts"

# Define the prefix string to prepend to each filename
PREFIX="https://github.com/npetraco/709/blob/main/R/script_bucket/"

# Define the output file
OUTPUT_FILE="filenames.txt"

# Clear the output file if it exists
> "$OUTPUT_FILE"

# Loop through all directories in the current directory
for dir in */; do
    # Remove trailing slash from directory name
    dir=${dir%/}
    
    # Check if the subdirectory exists in this directory
    if [ -d "$dir/$SUBDIR" ]; then
        # Loop through files in the subdirectory
        for file in "$dir/$SUBDIR"/*.R; do
            # Check if file exists (handles empty directories)
            if [ -e "$file" ]; then
                # Write the prefixed filename to the output file
                echo "${PREFIX}$(basename "$file")" >> "$OUTPUT_FILE"
            fi
        done
    fi
done

echo "Filenames written to $OUTPUT_FILE"