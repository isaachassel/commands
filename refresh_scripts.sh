#!/bin/bash

# Directory where your scripts are stored
SCRIPT_DIR="$(pwd)/scripts"

# Directory where symbolic links will be created
LINK_DIR="/usr/local/bin"

# Make all files in the scripts directory executable
chmod +x $SCRIPT_DIR/*

# Create or refresh symbolic links
for script in $SCRIPT_DIR/*.sh; do
    # Extract just the filename from the full path
    script_name=$(basename -- "$script")
    
    # Remove the '.sh' extension from the filename
    link_name=${script_name%.sh}

    # Full path to the symbolic link that should be created or replaced
    link_path="$LINK_DIR/$link_name"
    
    # Remove the existing symbolic link if it already exists
    if [ -L "$link_path" ]; then
        sudo rm "$link_path"
    fi
    
    # Create a new symbolic link
    sudo ln -s $script "$link_path"
done

echo "Scripts refreshed and symbolic links updated."

