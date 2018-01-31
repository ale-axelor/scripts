#!/bin/bash
BRANCHES=$(git branch -r --merged | grep -v master | grep -v 'wip$' | grep -v 'dev$' | grep -v upstream | sed 's/origin\///')
echo $BRANCHES

read -p "Delete these branches (y/n)? " answer

if [ "$answer" = "n" ]; then echo aborting && exit; fi

echo $BRANCHES | xargs -n 1 git branch -d
echo $BRANCHES | xargs -n 1 git push --delete origin
git fetch -p origin
