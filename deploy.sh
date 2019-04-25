#!/bin/bash

# Message for the commit
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Fetch the latest update to static/deeprl
echo -e "\033[0;32mUpdating static/deeprl...\033[0m"
git submodule update --remote static/deeprl


# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Push all local changes to github
echo -e "\033[0;32mPush local changes to GitHub...\033[0m"
git commit -a -m "$msg"
git push origin master

# Push website to Github pages
echo -e "\033[0;32mPush website to GitHub Pages...\033[0m"
cd public
git add *
git commit -a -m "$msg"
git push origin master
cd ..
