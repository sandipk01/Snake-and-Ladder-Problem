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

function play(){
while [ $position -ne $WIN_LIMIT ]
do 
#RANDOM NUMBER BETWEEN 1-6
randomNumber=$(( (RANDOM%3) + 1 ))
randomNumber2=$(( ( RANDOM%6 ) + 1 ))
printf "DICE NUMBER $randomNumber2 \n"
if [ $randomNumber -eq $IS_SNAKE ]
	then
		printf "SNAKE\n"
		checkPosition=$( isValidPosition $(( $position - $randomNumber2 )) $position )
		position=$checkPosition
	fi
if [ $randomNumber -eq $IS_LADDER ]
	then
		printf "Ladder\n"
		checkPosition=$( isValidPosition $(( $position + $randomNumber2 )) $position )
		position=$checkPosition
fi
if [ $randomNumber -eq $IS_NOPLAY ]
	then
		printf "NOPLAY\n"
		checkPosition=$(( $position + $NOPLAY ))
		position=$checkPosition
fi
echo  $position
done
}


play
