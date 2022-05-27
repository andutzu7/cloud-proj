rm -rf publish 

mkdir publish

cp templates/index.html publish/"$(echo $(date))"

aws s3 cp publish/* s3://cc-my-news-archive

rm -rf publish
