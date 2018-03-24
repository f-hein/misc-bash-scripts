wget -q -O arsenal.txt http://kanonierzy.com
	opponent=$(cat arsenal.txt | grep -m 1 '<span class="teams">'| grep -oP '(?<=">).*(?=</span>)')
	matchdate=$(cat arsenal.txt | grep -A 1 -m 1 '<span class="teams">'| grep -oP '(?<=">).*(?=</span>)' | tail -1 | awk '{print $1;}')
	matchtime=$(cat arsenal.txt | grep -A 1 -m 1 '<span class="teams">'| grep -oP '(?<=">).*(?=</span>)' | tail -1 | awk '{print $NF;}')
echo 'Next game:'
echo $opponent
echo $matchdate
echo $matchtime
rm arsenal.txt
today=$(date | grep -oP ', \K.*?(?=,)')
echo "Today's date: $today"
