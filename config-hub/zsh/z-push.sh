#!/bin/bash

cp ~/.zshrc "${PWD}"

git add .zshrc
git commit -m 'upsert .zshrc'
git push origin HEAD

echo "remove .zshrc"
rm .zshrc
echo "remove successed"
