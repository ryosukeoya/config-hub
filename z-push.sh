#!/usr/bin/env bash

if ! git diff --quiet; then
  echo "git differences already exist"
  exit 1
fi

cp ~/.zshrc "${PWD}"
git add .zshrc

if git diff --quiet; then
  echo "no differences in the .zshrc file"
  exit 1
fi

git commit -m 'upsert .zshrc'
git push origin HEAD

echo "remove .zshrc"
rm .zshrc
echo "remove successed"
