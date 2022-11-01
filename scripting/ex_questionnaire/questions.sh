#!/bin/bash

HEADING="\n~~ Questionnaire ~~\n"
echo -e $HEADING

: '
Set a variable
'
QUESTION1="What's your name?"

: '
Echo out a variable
'
echo $QUESTION1

: '
Take input into a variable
'
read NAME

QUESTION2="Where are you from?"

echo $QUESTION2
read LOCATION

QUESTION3="What's your favorite coding website?"

echo $QUESTION3
read WEBSITE

echo Hello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!