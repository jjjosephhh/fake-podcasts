#!/bin/bash

# Read the contents of input.txt into input_text
company="aws"
service="direct-connect"
prefix="${company}_${service}"
#podcast="the-joe-rogan-experience"
#podcast="this-american-life"
podcast="the-daily"
#podcast="lex-fridman"
input_text=$(cat "podcast_source/${prefix}_${podcast}.txt")
# Use sed to expand out contractions
input_text=$(echo "$input_text" | sed "s/can't/cannot/g; s/don't/do not/g; s/doesn't/does not/g; s/haven't/have not/g; s/i'm/i am/g; s/isn't/is not/g; s/it's/it is/g; s/let's/let us/g; s/shouldn't/should not/g; s/wasn't/was not/g; s/we'll/we will/g; s/we're/we are/g; s/we've/we have/g; s/what's/what is/g; s/who's/who is/g; s/won't/will not/g; s/you're/you are/g; s/you've/you have/g")
input_text=$(echo "$input_text" | sed "s/Can't/Cannot/g; s/Don't/Do not/g; s/Doesn't/Does not/g; s/Haven't/Have not/g; s/I'm/I am/g; s/Isn't/Is not/g; s/It's/It is/g; s/Let's/Let us/g; s/Shouldn't/Should not/g; s/Wasn't/Was not/g; s/We'll/We will/g; s/We're/We are/g; s/We've/We have/g; s/What's/What is/g; s/Who's/Who is/g; s/Won't/Will not/g; s/You're/You are/g; s/You've/You have/g")
# Use sed to replace " - " with ". "
input_text=$(echo "$input_text" | sed "s/ - /\, /g")
# Use sed to replace periods with commas
input_text=${input_text//./,}
# Use sed to replace S3 with S-Three
input_text=$(echo "$input_text" | sed "s/S3/Ess Three/g")
input_text=$(echo "$input_text" | sed "s/HIPAA/Health Insurance Portability and Accountability Act/g")
input_text=$(echo "$input_text" | sed "s/GDPR/General Data Protection Regulation/g")
input_text=$(echo "$input_text" | sed "s/GDPR/General Data Protection Regulation/g")
input_text=$(echo "$input_text" | sed "s/SOC/System and Organization Controls/g")
# Use sed to search and replace "aws" and "AWS" with "Amazon Web Services"
input_text=$(echo "$input_text" | sed "s/aws/Amazon Web Services/g; s/AWS/Amazon Web Services/g")
## Escape any problematic characters in the input text
#input_text=$(echo "$input_text" | sed "s/'/'\\\\''/g; s/[\*\[\]\\\$]/\\\\&/g")
## Replace newlines with spaces
#input_text=$(echo "$input_text" | tr '\n' ' ')

echo $input_text > "${company}/${service}/${podcast}.txt"

## Pass the sanitized input text to another shell command
## Split the input string into an array using ". " as the delimiter
#IFS="." read -ra sentences <<< "$input_text"
#
## Set the counter
#counter=0
## Loop through the array and print each sentence
#for sentence in "${sentences[@]}"
#do
#    counter=$((counter+1))
#    # Pad the number with 3 zeros
#    padded_number=$(printf "%03d" $counter)
#    echo "$sentence"
#    tts --text "$sentence" --out_path aws/s3/aws_s3_this-american-life-$padded_number.mp3
#done