data=$(curl -s http://radioluz.pwr.edu.pl/wp-content/themes/radioluz/rds-reader.php)
author=$(echo $data | grep -oP -m 1 '">\K.*?(?=<)' | head -1)
nextauthor=$(echo $data | grep -oP -m 1 't">\K.*?(?=<)'| tail -1)
echo 'W Studenckim Radiu LUZ leci:'
authors="TERAZ: $author"
echo $authors
nexts="NASTĘPNIE: $nextauthor"
echo $nexts
