#!/bin/sh

HELPERS_DIR="$HOME/.config/sketchybar/helpers"
END_TIME_FILE="$HELPERS_DIR/timer.end_time"
SOUND="Purr"  # Sound to play
SOUND_DELAY=3 # Seconds to wait between sounds repeat

# Read the current time from the file
CURRENT_TIME=$(cat "$END_TIME_FILE")

# Split the time into minutes and seconds
MINUTES=$(echo "$CURRENT_TIME" | cut -d':' -f1)
SECONDS=$(echo "$CURRENT_TIME" | cut -d':' -f2)

# Remove leading zeros to avoid octal interpretation
MINUTES=$(echo "$MINUTES" | sed 's/^0*//')
SECONDS=$(echo "$SECONDS" | sed 's/^0*//')

# Handle empty strings (if all zeros were removed)
[ -z "$MINUTES" ] && MINUTES=0
[ -z "$SECONDS" ] && SECONDS=0

# Calculate the total seconds
TOTAL_SECONDS=$(( MINUTES * 60 + SECONDS ))

# Decrement the total seconds
TOTAL_SECONDS=$(( TOTAL_SECONDS - 1 ))

# Handle negative times (loop back to 59)
if [ "$TOTAL_SECONDS" -lt 0 ]; then
  # Timer has reached 00:00
  # Play sound, if configured
  sketchybar --set timer update_freq=$SOUND_DELAY
    if [ -n "$SOUND" ]; then
      afplay /System/Library/Sounds/"$SOUND".aiff &
    fi

  exit 0
fi

# Calculate the new minutes and seconds
NEW_MINUTES=$(( TOTAL_SECONDS / 60 ))
NEW_SECONDS=$(( TOTAL_SECONDS % 60 ))

# Format with leading zeros
FORMATTED_MINUTES=$(printf "%02d" "$NEW_MINUTES")
FORMATTED_SECONDS=$(printf "%02d" "$NEW_SECONDS")

# Create the new formatted time
NEW_TIME="$FORMATTED_MINUTES:$FORMATTED_SECONDS"

# Write the new time to the file
echo "$NEW_TIME" > "$END_TIME_FILE"

# Update SketchyBar
sketchybar --set timer label="$NEW_TIME"
