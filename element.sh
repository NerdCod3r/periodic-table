#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# if the program is run without an arguument
if [[ ! $1 ]]
then
    echo -e "Please provide an element as an argument."
fi

# argument provided
arg=$1
# if atomic number is provided
if [[ $arg =~ ^[0-9]+$ && $arg -gt 0  ]]
then
    echo -e "\nYou entered an atomic number."

# if element symbol is provided (max of 2 characters)
elif [[ $arg =~ ^[A-Z][a-z]{0,1}$ ]]
then
    echo -e "\nYou entered the symbol of the element."
# if element name is provided
elif [[ $arg =~ ^[A-Za-z]+$ ]]
then
    echo -e "\nYou entered the element name."
fi
