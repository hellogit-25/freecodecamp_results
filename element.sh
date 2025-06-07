#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -n $1 ]]; then 
  if [[ $1 =~ ^[0-9]+$ ]]; then
    atomic_nr=$1
  else
    atomic_nr=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1';")
    fi
  max_nr=$($PSQL "SELECT atomic_number FROM elements ORDER BY atomic_number DESC LIMIT 1")
  if [[ -z $atomic_nr ]] || [[ $atomic_nr -gt $max_nr ]] || [[ $atomic_nr -lt 1 ]]; then
    echo "I could not find that element in the database."
  else
    symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$atomic_nr;")
    name=$($PSQL "SELECT name FROM elements WHERE atomic_number=$atomic_nr")
    melting=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$atomic_nr;")
    boiling=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$atomic_nr;")
    mass=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$atomic_nr;")
    type=$($PSQL "SELECT type FROM types INNER JOIN properties USING (type_id) WHERE atomic_number=$atomic_nr;")
    echo "The element with atomic number $atomic_nr is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."
    fi
else
  echo "Please provide an element as an argument."
  fi

