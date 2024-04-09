#!/bin/bash

if [ -e "${PWD}/.gitconfig" ]; then
    rm "${PWD}/.gitconfig"
fi
cp ~/.gitconfig "${PWD}/.gitconfig"

git add .gitconfig
git commit -m 'update .gitconfig'
git push origin HEAD
