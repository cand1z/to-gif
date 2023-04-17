#!/bin/bash

# Check that the correct number of arguments was passed
if [ $# -ne 2 ]; then
    echo "Correct way of use: $0 original_file.gif final_file.gif"
    exit 1
fi

# Checks if the input video file exists
if [ ! -f "$1" ]; then
    echo "Input video file $1 does not exist"
    exit 1
fi

# Checks if the output file already exists and asks for confirmation to overwrite it
if [ -f "$2" ]; then
    read -p "Output file $2 already exists. Do you want to overwrite it? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        exit 1
    fi
fi

# Get the duration of the video
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1")

# Set video to GIF conversion parameters
palette="/tmp/palette.png"
filters="fps=15,scale=-1:-1:flags=lanczos"

# Create the color palette
ffmpeg -v warning -i "$1" -vf "$filters,palettegen" -y "$palette"

# Converts the video to a GIF file
ffmpeg -v warning -i "$1" -i "$palette" -lavfi "$filters [x]; [x][1:v] paletteuse" -y "$2"

# Displays the completion message
echo "Conversion completed. File $2 was successfully created."

