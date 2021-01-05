#!/bin/bash
function Random()
{
	local Min=$1
	local Max=$[$2-$1+1]
	local radnum=$(date +%s%N)
	echo $[$radnum%$Max+$Min]
}
declare -i index_new
declare -ia newarray=(`echo "$@"`)
for((index=1;index<$#;index++))
do
	index_new=`Random 0 $index`
	temp=${newarray[index]}
	newarray[index]=${newarray[index_new]}
	newarray[index_new]=temp
done
echo "${newarray[*]}"
