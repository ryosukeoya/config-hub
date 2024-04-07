#!bin/bash

git add .

if ! git diff-index --quiet HEAD --; then
    git commit -m "$1" -m "$2"
    git push origin HEAD
fi
