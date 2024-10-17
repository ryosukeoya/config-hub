#!/usr/bin/env bash

git tag --sort -v:refname | grep $1 | head -n 10
