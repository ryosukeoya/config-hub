#!/usr/bin/env bash

cp ~/.zshrc "${PWD}"
git add -f .zshrc
git commit -m 'upsert .zshrc'
git push origin HEAD

echo "remove .zshrc"
rm .zshrc
echo "remove successed"
