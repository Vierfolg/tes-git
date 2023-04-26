#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# secret number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# screen display
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME' ;")

if [[ -z $USER_ID ]]
then
    # insert username to database
    INSERT_NEWUSER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
    # if found existing name
    GAMES_PLAY=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID ;")
    BEST_GAMES=$($PSQL "SELECT MIN(games_played) FROM games WHERE user_id = $USER_ID;")
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAY games, and your best game took $BEST_GAMES guesses."
fi

# screen display
echo -e "Guess the secret number between 1 and 1000:"
TRIES=0
while [[ ! $GUESS -eq $SECRET_NUMBER ]]
  do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      # if not integer
      echo -e "That is not an integer, guess again:"
    else
        TRIES=$(($TRIES + 1))
        # new if secret number
        if [[ $GUESS -lt $SECRET_NUMBER ]]
        then
          # if lower
          echo -e "It's lower than that, guess again:"
        elif [[ $GUESS -gt $SECRET_NUMBER ]]
        then
          # if higher
          echo -e "It's higher than that, guess again:"
        fi
    fi
done

USER_ID_GAMES=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(games_played, user_id) VALUES($TRIES, $USER_ID_GAMES);")
echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
