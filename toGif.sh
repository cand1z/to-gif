#!/bin/bash

# Check if the video file was provided as an argument
if [ -z "$1" ]; then
  echo "Please provide a video file as an argument."
  exit 1
fi

# Defines the name of the GIF file to be generated
filename="${1%.*}.gif"

# Use the ffmpeg program to convert the video file into a GIF file
ffmpeg -i "$1" -vf "scale=320:-1:flags=lanczos,fps=10" -loop 0 "$filename"

# Checks if the conversion completed successfully
if [ $? -eq 0 ]; then
  echo "Successfully generated GIF file: $filename"
else
  echo "An error occurred while generating the GIF file."
fi

