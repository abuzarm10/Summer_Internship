#!/bin/bash

# Function to clean the input string
clean_string() {
    local input="$1"
    # Convert to lowercase, remove spaces and punctuation
    echo "$input" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:][:punct:]'
}

# Function to check if the string is a palindrome
is_palindrome() {
    local cleaned_string="$1"
    local reversed_string="$(echo "$cleaned_string" | rev)"

    if [ "$cleaned_string" == "$reversed_string" ]; then
        echo "The input string is a palindrome."
    else
        echo "The input string is not a palindrome."
    fi
}

# Prompt user for input
read -p "Enter a string: " user_input

# Clean the input string
cleaned_input=$(clean_string "$user_input")

# Check if the cleaned input is a palindrome
is_palindrome "$cleaned_input"

# Initialize a new Git repository if not already initialized
if [ ! -d .git ]; then
    git init
fi

# Create necessary directories for the script path
mkdir -p bash/S1_1

# Specify the script file path
script_path="bash/S1_1/code.sh"

# Write the script content to the specified path
echo '#!/bin/bash' > $script_path
echo "" >> $script_path
echo "$(declare -f clean_string)" >> $script_path
echo "$(declare -f is_palindrome)" >> $script_path
echo 'read -p "Enter a string: " user_input' >> $script_path
echo 'cleaned_input=$(clean_string "$user_input")' >> $script_path
echo 'is_palindrome "$cleaned_input"' >> $script_path

# Make the script executable
chmod +x $script_path

# Commit the script to the Git repository
git add $script_path
git commit -m "Add palindrome checker script"

# Set remote repository and push
repo_url="https://github.com/abuzarm10/Summer_Internship.git"
git remote add origin "$repo_url" 2>/dev/null || git remote set-url origin "$repo_url"
git branch -M main
git push -u origin main

