#!/bin/bash
# increment version in pubspec.yaml
PUBSPEC="pubspec.yaml"
VERSION_LINE=$(grep 'version:' $PUBSPEC)
VERSION_NUMBER=$(echo $VERSION_LINE | sed 's/version: //')
BASE_VERSION=$(echo $VERSION_NUMBER | cut -d'+' -f1)

echo "Current version: $BASE_VERSION"
echo "insert new version:"
read NEW_VERSION_NUMBER

# make sure the new version number is not empty
if [ -z "$NEW_VERSION_NUMBER" ]; then
  echo "Version number cannot be empty"
  exit 1
fi

# make sure the new version number is not the same as the current version
if [ "$NEW_VERSION_NUMBER" == "$BASE_VERSION" ]; then
  echo "Version number cannot be the same as the current version"
  exit 1
fi

# make sure the new version number is higher than the current version
if [ "$NEW_VERSION_NUMBER" \< "$BASE_VERSION" ]; then
  echo "Version number must be higher than the current version"
  exit 1
fi

# Increment the build number
NEW_BUILD_NUMBER=$(date "+%Y%m%d%H%M")

# Construct the new version number
NEW_VERSION_NUMBER="$NEW_VERSION_NUMBER+$NEW_BUILD_NUMBER"

# Replace the old version number with the new one in pubspec.yaml
sed -i '' "s/$VERSION_NUMBER/$NEW_VERSION_NUMBER/" $PUBSPEC

echo "Version updated to $NEW_VERSION_NUMBER"

git add . 
git commit -am "Version updated to $NEW_VERSION_NUMBER"
git tag -s "v$NEW_VERSION_NUMBER" -m "Version updated to $NEW_VERSION_NUMBER"
git push
git push --tags

# flutter clean web
# flutter build web 
# cd build/web
# echo "dennisaurus.dev" > CNAME
# # check if .git exists and run git init if not
# if [ ! -d ".git" ]; then
#   git init
# fi
# git add .
# # check if master branch exists and create it if not
# if ! git rev-parse --verify master; then
#   git checkout -b master
# fi

# # create git commit with todays date in UTC as message
# DATE_TIME=$(TZ=UTC date '+%Y%m%d%H%M%S')
# git commit -m "$DATE_TIME"
# # create git tag with todays date in UTC as message
# git tag "deploy-$DATE_TIME" -m "$DATE_TIME"

# # add remote if not exists
# if ! git remote | grep -q "origin"; then
#   git remote add origin git@github.com:Dennisaurus-Rex/galvend.github.io.git
# fi

# # push tags and master branch
# git push --tags
# git push origin master --force
