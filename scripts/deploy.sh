#!/bin/sh

git clone --depth=1 -b gh-pages https://github.com/open-mpi/mtt.git gh-pages
tar -C docs -cf - . | tar -C gh-pages -xf -

cd gh-pages

git add html

if git diff --exit-code --quiet html > /dev/null 2>&1; then
    echo NOTHING TO PUSH
else
    echo PUSHING CHANGES
    git add .
    git commit -m "Deploy updated open-mpi/mtt to gh-pages"
    git push https://$GH_TOKEN@github.com/open-mpi/mtt.git gh-pages
fi
