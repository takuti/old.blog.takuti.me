#! /bin/sh

echo '' > .htaccess

for FILE in ../_posts/*.html
do
  if [[ ${FILE} =~ ^_posts/([0-9]{4})-([0-9]{2})-[0-9]{2}-([0-9a-zA-Z\-]+)\.html$ ]] ; then # ex) _posts/2013-10-27-time-capsule.html
    echo "Redirect 301 /${BASH_REMATCH[3]}/ /${BASH_REMATCH[1]}/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/" >> .htaccess

  fi
done

