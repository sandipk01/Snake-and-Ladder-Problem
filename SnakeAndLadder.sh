#!/bin/bash -x

#This problem simulates a Snake and Ladder Game. The Player
#starts from 0 rolls the die to get a number between 1 to 6, finds
#a safe place, ladder or a snake keeps doing till the winning spot
#100 is achieved.

#CONSTANTS
IS_SNAKE=1
IS_LADDER=2
IS_NOPLAY=3
NOPLAY=0
WIN_LIMIT=100
#VARIABLE
position=0
randomNumber=0
randomNumber2=0
checkPosition=0
diceCounter=0

#CHECK VALID POSITION
function isValidPosition() {
#CHECK IF LESS THAN 0
if [ $1 -lt 0 ]
	then
   	echo 0
#CHECK GREATER THAN 100
   	 elif [ $1 -gt 100 ]
       	then
         	echo $2
      	else
         	echo $1
fi
}

#PLAY
function play(){
#RANDOM NUMBER BETWEEN 1-6
checkPosition=0
randomNumber=$(( (RANDOM%3) + 1 ))
randomNumber2=$(( ( RANDOM%6 ) + 1 ))
if [ $randomNumber -eq $IS_SNAKE ]
	then
		checkPosition=$( isValidPosition $(( $1 - $randomNumber2 )) $1 )
	fi
if [ $randomNumber -eq $IS_LADDER ]
	then
		checkPosition=$( isValidPosition $(( $1 + $randomNumber2 )) $1 )
fi
if [ $randomNumber -eq $IS_NOPLAY ]
	then
		checkPosition=$(( $1 + $NOPLAY ))
fi
echo $checkPosition
}

#DOUBLE PLAYER
function doublePlayer(){
local result=0
local player1=0
local player2=0
local counter=0
while [ $result -eq 0 ]
do
	 tplayer1="$( play $player1 )"
	 player1=$tplayer1
	 tplayer2="$( play $player2 )"
	 player2=$tplayer2
	printf "$counter Player 1 | position $player1\n"
  	printf "$counter Player 2 | position $player2\n"
	counter=$(( $counter + 1 ))
	if [ $player1 -ge 100 ]
		then
			printf "player 1 Win "
			result=1
			break
	fi
	if [ $player2 -ge 100 ]
		then
			printf "player 2 Win "
			result=1
			break
	fi
done
}

#START FUNCTION
doublePlayer

