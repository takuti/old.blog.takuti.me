#! /bin/sh

echo 'RewriteEngine on' > .htaccess

for FILE in _posts/*
do
  if [[ ${FILE} =~ ^_posts/([0-9]{4})-([0-9]{2})-([0-9]{2})-([0-9a-zA-Z\-]+).*$ ]] ; then # ex) _posts/2013-10-27-time-capsule.html
   # echo "Redirect permanent /${BASH_REMATCH[1]}/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/${BASH_REMATCH[4]}/ http://takuti.me/note/${BASH_REMATCH[4]}/" >> .htaccess
   # echo "Redirect permanent /${BASH_REMATCH[1]}/${BASH_REMATCH[2]}/${BASH_REMATCH[4]}/ http://takuti.me/note/${BASH_REMATCH[4]}/" >> .htaccess
   # echo "Redirect permanent /${BASH_REMATCH[4]}/ http://takuti.me/note/${BASH_REMATCH[4]}/" >> .htaccess
    echo "RewriteRule ^${BASH_REMATCH[1]}/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/${BASH_REMATCH[4]}/ http://takuti.me/note/${BASH_REMATCH[4]}/ [R=301,L]" >> .htaccess
    echo "RewriteRule ^${BASH_REMATCH[1]}/${BASH_REMATCH[2]}/${BASH_REMATCH[4]}/ http://takuti.me/note/${BASH_REMATCH[4]}/ [R=301,L]" >> .htaccess
    echo "RewriteRule ^${BASH_REMATCH[4]}/ http://takuti.me/note/${BASH_REMATCH[4]}/ [R=301,L]" >> .htaccess
  fi
done

echo 'RewriteRule ^ http://takuti.me/ [R=301,L]' >> .htaccess
