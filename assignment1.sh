#!/bin/bash
read -p "Enter your birthdate (yyyy-mm-dd): " Birthdate

if [[ ! $Birthdate =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Invalid date format. Please use yyyy-mm-dd."
    exit 1
fi


if ! date -d "$Birthdate" >/dev/null 2>&1; then
    echo "Invalid date. Please enter a real date."
    exit 1
fi


current_date=$(date +%s)
birthdate_seconds=$(date -d "$Birthdate" +%s)
age=$(( (current_date - birthdate_seconds) / (365*24*60*60) ))

echo "You are $age years old."
