#!/bin/bash

generate_filename() {
    # Generate 5 random numbers and append .png extension
    echo "$$.png"
}

capture_screenshot() {
    # Directory to save screenshots
    save_directory="$HOME/Pictures/Screenshots"
    mkdir -p "$save_directory"  # Create directory if it doesn't exist

    # Generate a unique filename based on random numbers
    filename="$save_directory/$(generate_filename)"

    # Use slurp to select a region interactively and pass the coordinates to grim for capturing
    slurp_output=$(slurp)
    if [ $? -eq 0 ]; then
        grim -g "$(echo $slurp_output)" "$filename"
        echo "Screenshot saved as: $filename"
    else
        echo "Error: Failed to capture screenshot."
    fi
}

capture_screenshot


