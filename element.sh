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
# if element symbol is provided (max of 2 characters)
# if element name is provided