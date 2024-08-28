#!/bin/bash

clean_string () 
{ 
    local input="$1";
    echo "$input" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:][:punct:]'
}
is_palindrome () 
{ 
    local cleaned_string="$1";
    local reversed_string="$(echo "$cleaned_string" | rev)";
    if [ "$cleaned_string" == "$reversed_string" ]; then
        echo "The input string is a palindrome.";
    else
        echo "The input string is not a palindrome.";
    fi
}
read -p "Enter a string: " user_input
cleaned_input=$(clean_string "$user_input")
is_palindrome "$cleaned_input"
