#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

DATE=$(date +"%4N")
FILENAME="$SCREENSHOT_DIR/$DATE.png"

select_region() {
    slurp_region=$(slurp)
    if [ -n "$slurp_region" ]; then
        grim -g "$slurp_region" "$FILENAME"
        grim -g "$slurp_region" - | wl-copy
    fi
}

select_region
