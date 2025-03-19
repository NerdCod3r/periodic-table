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
    # retrieve element information
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$arg")
    # if element is not found
    if [[ -z $ELEMENT ]]
    then
        echo "I could not find that element in the database."
    else
        echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
        do
           # get the properties info of the element. 
           ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$arg")
           # parse the information and print the statement to the user.
           echo "$ELEMENT_PROPERTIES" | while IFS="|" read ATOMIC_NUMBER_PROPERTIES ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
           do
                # get the type_name of the metal from types table
                TYPE_NAME=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID" )
                # echo the output
                echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_NAME, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
           done
        done
    fi

# if element symbol is provided (max of 2 characters)
elif [[ $arg =~ ^[A-Z][a-z]{0,1}$ ]]
then
   # get the element information.
   ELEMENT_SELECT_INFO=$($PSQL "SELECT * FROM elements WHERE symbol='$arg'")
   # if element is not found
   if [[ -z $ELEMENT_SELECT_INFO ]]
   then
        echo "I could not find that element in the database."
    else
        # get the element's properties.
        echo "$ELEMENT_SELECT_INFO" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
        do
            ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

            echo "$ELEMENT_PROPERTIES" | while IFS="|" read ATOMIC_NUMBER_PROPERTIES ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
            do
                # get the type of the element
                TYPE_NAME=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")

                echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_NAME, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
            done
        done
    fi
# if element name is provided
elif [[ $arg =~ ^[A-Za-z]+$ ]]
then
    # get element info
    ELEMENT_INFO_NAME=$($PSQL "SELECT * FROM elements WHERE name ILIKE '$arg'")
    # if element is not found
    if [[ -z $ELEMENT_INFO_NAME ]]
    then
        echo -e "I could not find that element in the database."
    else
        # get the properties of the element
        echo "$ELEMENT_INFO_NAME" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
        do
            ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
            # prepare the output
            echo "$ELEMENT_PROPERTIES" | while IFS="|" read ATOMIC_NUMBER_PROPERTIES ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
            do
                # get the type name
                TYPE_NAME=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")

                # print the output
                echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_NAME, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
            done
        done
    fi
fi
