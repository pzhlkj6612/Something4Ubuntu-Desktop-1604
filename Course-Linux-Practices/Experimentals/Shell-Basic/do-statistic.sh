#! /bin/bash


#Do you know shell array?
#Array=('a' 'b' 'c')
#echo ${Array[0]}


inFile='pc.txt'

if [ ! -e $inFile ]
	then
		echo 'student1:1301:75'  > $inFile 
		echo 'Student2:1302:96' >> $inFile
		echo 'Student3:1303:99' >> $inFile
		echo 'Student4:1302:93' >> $inFile
		echo 'Student5:1303:23' >> $inFile
		echo 'Student6:1301:77' >> $inFile
fi

declare -i Class1301=0
declare -i Class1302=0
declare -i Class1303=0

declare -i Class1301_SUM=0
declare -i Class1302_SUM=0
declare -i Class1303_SUM=0

for line in $(cat $inFile)
	do
		var1=$(echo "$line" | awk -F ':' '{print $2}')
		declare -i var2=$(echo "$line" | awk -F ':' '{print $3}')

		case $var1 in
			'1301')
				Class1301=$Class1301+1
				Class1301_SUM=$Class1301_SUM+$var2
				;;
			'1302')
				Class1302=$Class1302+1
				Class1302_SUM=$Class1302_SUM+$var2
				;;
			'1303')
				Class1303=$Class1303+1
				Class1303_SUM=$Class1303_SUM+$var2
				;;
		esac
	done

Class1301_AVG=$(echo "$Class1301_SUM/$Class1301" | bc -l)
Class1302_AVG=$(echo "$Class1302_SUM/$Class1302" | bc -l)
Class1303_AVG=$(echo "$Class1303_SUM/$Class1303" | bc -l)

echo "Class 1301: $Class1301, Sum: $Class1301_SUM, AVG(sum): $Class1301_AVG"
echo "Class 1302: $Class1302, Sum: $Class1302_SUM, AVG(sum): $Class1302_AVG"
echo "Class 1303: $Class1303, Sum: $Class1303_SUM, AVG(sum): $Class1303_AVG"

rm $inFile
