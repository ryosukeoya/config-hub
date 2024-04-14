#!/bin/bash

if [ -e "${PWD}/.zshrc" ]; then
    rm "${PWD}/.zshrc"
fi
cp ~/.zshrc "${PWD}/.zshrc"

git add .zshrc
git commit -m 'upsert .zshrc'
git push origin HEAD
