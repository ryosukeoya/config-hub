#!/usr/bin/env bash

export DIRENV_DISABLE=1
echo "export DIRENV_DISABLE=1"

cleanup() {
  unset DIRENV_DISABLE
  echo "unset DIRENV_DISABLE"
}

trap cleanup EXIT ERR

repos=(
  "/home/ryo/ghq/github.com/plusmedi/mhv2-app"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-app-docs"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-app-api"
  "/home/ryo/ghq/github.com/plusmedi/c6o-poc-bff"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-api-specs"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-backend-docs"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-backends"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-infra"
  "/home/ryo/ghq/github.com/plusmedi/mhv2-admin"
  "/home/ryo/ghq/github.com/plusmedi/myhospital-backends"
)

for repo in "${repos[@]}"; do
  cd "${repo}" || return
  origin_head=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  git switch "${origin_head}"
  git pull origin "${origin_head}"
done
