#!/bin/bash 

gambler=100
Gambler_bet=1
Gambler_Stake_Win=$(($gambler+$gambler/2))
Gambler_Stake_Loose=$(($gambler-$gambler/2))
Gambler_Fix=100
gambler_Total_Money=0
day_Count=0
luckiest=$gambler
unluckiest=$gambler
while [ $day_Count != 30 ]
do
((day_Count++))
gambler=$Gambler_Fix
        while [[ $gambler != $Gambler_Stake_Win && $gambler != $Gambler_Stake_Loose ]]
        do
                val=$((RANDOM%2))
                if [[ $val == 1 ]]
                then
                        gambler=$(($gambler+$Gambler_bet))
                elif [[ $val == 0 ]]
                then
                        gambler=$(($gambler-$Gambler_bet))
                fi
        done
        if [[ $gambler == 150 ]]
        then
                gambler_won=$(( $gambler - $Gambler_Fix ))
                echo "Gambler Won $gambler_won on $day_Count day"
        else
                gamblor_won=$(( $Gambler_Fix - $gambler ))
                echo "Gambler lost $gambler_won on $day_Count day"
        fi
        gambler_Total_Money=$(( $gambler_Total_Money + ($gambler-$Gambler_Fix) ))
                if [ $luckiest -lt $gambler_Total_Money ]
                then
                        luckiest_day=$day_Count
			luckiest=$gambler_Total_Money
                fi
                if [ $unluckiest -gt $gambler_Total_Money ]
                then
                        unluckiest_day=$day_Count
			unluckiest=$gambler_Total_Money
                fi
        if [ $gambler_Total_Money -gt 0 ]
        then
                echo "Gambler wins $gambler_Total_Money!!!!!!!!!!!!!!!!!!!!!!!"
        elif [ $gambler_Total_Money  -le 0 ]
        then
                temp=$(( 2 * $gambler_Total_Money - $gambler_Total_Money ))
                echo "Gambler looses $temp!!!!!!!!!!!!!!!!!!!!!!"
        fi
done
echo "My luckiest Day was $luckiest_day  when I won :$luckiest"
echo "My unluckiest day was $unluckiest_day when I loose :$unluckiest"

