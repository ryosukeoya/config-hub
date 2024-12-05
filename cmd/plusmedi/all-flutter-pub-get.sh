#!/usr/bin/env bash

# repos=$(find ~p -name pubspec.yaml)

# for repo in "${repos[@]}"; do
#   r=${repo}
#   echo $r
#   cd "$(dirname "${r}")" || return
#   flutter pub get
# done

# `find` を使用して pubspec.yaml を検索し、安全に処理
find ~p -name pubspec.yaml | while IFS= read -r repo; do
  echo $repo
  # 対象ディレクトリに移動
  cd "$(dirname "$repo")" || {
    echo "Failed to cd into directory for $repo"
    return
  }

  # `flutter pub get` 実行
  if ! flutter pub get; then
    echo "Failed to run flutter pub get in $repo"
    return
  fi
done
