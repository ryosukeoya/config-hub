#!/bin/bash

diff_files=$(git diff --name-only HEAD)

git add .
git commit -m "update ${diff_files}"
git push origin HEAD
