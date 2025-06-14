#!/bin/bash

rand_num=$((1 + $RANDOM % 1000))
PSQL="psql --username=freecodecamp --dbname=games -t --no-align -c"

echo "Enter your username:"
read username

current_names=$($PSQL "SELECT name FROM names WHERE name='$username';")

if [[ -z $current_names ]];then
  echo "Welcome, $username! It looks like this is your first time here."
  insert_name=$($PSQL "INSERT INTO names(name) VALUES('$username')")
else
  name_id=$($PSQL "SELECT name_id FROM names WHERE name='$username'")
  num_games=$($PSQL "SELECT COUNT(*) FROM games WHERE name_id=$name_id")
  best_game=$($PSQL "SELECT MIN(num_guesses) FROM games WHERE name_id=$name_id")
  echo "Welcome back, $username! You have played $num_games games, and your best game took $best_game guesses."
  fi

echo "Guess the secret number between 1 and 1000:"
count=0

while [[ $guess -ne $rand_num ]]
  do
  read guess

  if [[ $guess =~ ^[0-9]+$ ]];then
    ((count+=1))
    if [[ $guess -gt $rand_num ]];then
      echo "It's lower than that, guess again:"
    elif [[ $guess -lt $rand_num ]];then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $count tries. The secret number was $rand_num. Nice job!"
      fi
  else
    echo "That is not an integer, guess again:"
    fi
  done

name_id=$($PSQL "SELECT name_id FROM names WHERE name='$username'")

insert_game=$($PSQL "INSERT INTO games(name_id, num_guesses) VALUES($name_id, $count)")