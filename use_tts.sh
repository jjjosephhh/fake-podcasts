#!/bin/bash

# Define default values for input and output
input="input.txt"
output="output.txt"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --input)
      input="$2"
      shift 2
      ;;
    --output)
      output="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done
# Read the contents of input.txt into input_text
input_text=$(cat $input)
# Escape any special characters in the input text
input_text_escaped=$(printf '%q' "$input_text")
# Pipe the input text to the tts command
echo "$input_text_escaped" | tts --out_path $output --text -
