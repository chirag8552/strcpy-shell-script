rm file1
rm file2
rm file3
rm file4

grep -irn strcpy * > file1

while read line;do
	p=$(echo $line | awk -F '(' '{print $2}' | awk -F ',' '{print $1}'); 
	q=$(echo $line | awk -F '(' '{print $2}' | awk -F ',' '{print $2}');
	
	echo $line >> file2
	echo "p = "$p >> file2
	echo "q = "$q >> file2

	x=$(echo $p | sed $'s/[\/_.->; -]//g' | tr -d '[' | tr -d ']');
	y=$(echo $q | sed $'s/[\/_.->; -]//g' | tr -d '[' | tr -d ']');

	echo "x = "$x >> file3
	echo "y = "$y >> file3

	if [ ! -z "$str" -a "$str" != " " ]
	then
		if [ $x == $y ]
		then
			echo $line >> file4
			echo $x >> file4
			echo $y >> file4
		fi
	fi
	
done < file1


