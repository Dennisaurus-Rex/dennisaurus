#!/bin/bash

flutter clean web
flutter build web --base-href /galvend.github.io/
cd build/web
# check if .git exists and run git init if not
if [ ! -d ".git" ]; then
  git init
fi
git add .
# check if master branch exists and create it if not
if ! git rev-parse --verify master; then
  git checkout -b master
fi

# create git commit with todays date in UTC as message
DATE_TIME=$(TZ=UTC date '+%Y%m%d%H%M%S')
git commit -m "$DATE_TIME"
# create git tag with todays date in UTC as message
git tag "deploy-$DATE_TIME" -m "$DATE_TIME"

# add remote if not exists
if ! git remote | grep -q "origin"; then
  git remote add origin git@github.com:Dennisaurus-Rex/galvend.github.io.git
fi

# push tags and master branch
git push --tags
git push origin master --force
