#!/bin/sh

no_articles=5
rds_host=""
name=""
password=""
db_name=""
table_name=""
port=None

mysql -h $rds_host -P $port -u $name  -p$password -e "use test;delete from news"

for file in out/*; do
	cat $file | head -n $no_articles > tmp;
	while read p; do
	title=$(echo $p | sed -e "s/'//g")
	base=$(echo $(basename $file))
	date=$(date)
	insert_query="INSERT INTO $table_name (title,source,date) values('$title','$base','$date')"
	mysql -h $rds_host -P $port -u $name  -p$password -e "use test;$insert_query"
	done <tmp
	rm -rf tmp

done
