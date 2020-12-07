#!/bin/bash
declare -i N=8
declare -ia array
declare -i count=0
#$1是行数，$2是列数
function isplaceok()
{
	local i
	for((i=1;i<$1;i++))
	do
		if ((array[$i]==$2))||((array[$i]-i==$2-$1))||((array[$i]+i==$2+$1))
		then
			return 1
		fi
	done
	return 0
}
function printsolution()
{
	local i
	local j
	for((i=1;i<=N;i++))
	do
		for((j=1;j<=N;j++))
		do
			if ((array[$i]==j))
			then
				echo -n "X"
			else
				echo -n "-"
			fi
		done
		echo
	done
	echo 
}
function addqueen()
{
	local index
	local next
	for((index=1;index<9;index++))
	do
		if isplaceok $1 $index
		then
			let array[$1]=$index
			if (($1==8))
			then
				printsolution
				count=$[$count+1]
				return
			fi
			let next=$1+1
			addqueen $next
		fi
	done
}
addqueen 1
echo "count=$count"








#array=(0 1 2 3 4 5 6 7 8)
