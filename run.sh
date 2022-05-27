#!/bin/sh

rm -rf out

sh publish_to_bucket.sh

sh get_feeds.sh

sh insert_articles_in_db.sh

echo > templates/index.html

cat templates/template.html > templates/index.html

python sql.py

sudo docker-compose stop

sudo docker-compose build

sudo docker-compose up -d

python notify.py
