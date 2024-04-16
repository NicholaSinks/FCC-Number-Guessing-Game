#!/bin/bash

# This is a game that generates a random number and uses user input to
# get guesses until the user guesses the number. It stores users and
# games in a database and provides information from the database to 
# users as they play the game.

PSQL="psql --username=freecodecamp --dbname=user_data --tuples-only --no-align -c"

RAN_NUM=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME_INPUT

GET_USER_RESULT=$($PSQL "SELECT name FROM users WHERE name='$USERNAME_INPUT'")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$GET_USER_RESULT'")

if [[ -n $GET_USER_RESULT ]]
then
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $GET_USER_RESULT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME_INPUT')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME_INPUT'")
fi

echo "Guess the secret number between 1 and 1000:"
NUMBER_GUESSES=0


PLAY_ROUND () {
  read NUM_INPUT
  NUMBER_GUESSES=$(( $NUMBER_GUESSES + 1 ))
  if [[ $NUM_INPUT =~ ^[0-9]+$ ]]
  then
    if [[ $RAN_NUM -gt $NUM_INPUT ]]
    then
      echo "It's higher than that, guess again:"
      PLAY_ROUND
    elif [[ $RAN_NUM -lt $NUM_INPUT ]]
    then
      echo "It's lower than that, guess again:"
      PLAY_ROUND
    else
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($NUMBER_GUESSES, $USER_ID)")
      echo "You guessed it in $NUMBER_GUESSES tries. The secret number was $RAN_NUM. Nice job!"
    fi
  else
    echo "That is not an integer, guess again:"
    PLAY_ROUND
  fi
}

PLAY_ROUND