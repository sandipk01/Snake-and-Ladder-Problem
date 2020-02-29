#!/bin/bash -x

#This problem simulates a Snake and Ladder Game. The Player
#starts from 0 rolls the die to get a number between 1 to 6, finds
#a safe place, ladder or a snake keeps doing till the winning spot
#100 is achieved.

#VARIABLE
position=0
randomNumber=0

#RANDOM NUMBER BETWEEN 1-6
randomNumber=$((  ( RANDOM%6 ) + 1 ))

echo $randomNumber

