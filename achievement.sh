#!/bin/bash

set -e

if [ ! -f .env ]; then
  cp .env.example .env
fi

source .env

REPO_NAME="${REPO_NAME:-achievement}"
BRANCH_NAME="${BRANCH_NAME:-achievement}"

if [ -d "$REPO_NAME" ]; then
  rm -rf $REPO_NAME
fi

if ! command -v jq &>/dev/null; then
  sudo apt update
  sudo apt install jq
fi

GITHUB_USER=$(gh api /user | jq -r '.login')

if ! gh repo view $REPO_NAME &>/dev/null; then
  gh repo create $REPO_NAME --private --add-readme -c
else
  gh repo clone $GITHUB_USER/$REPO_NAME
fi

cd $REPO_NAME

git checkout -b $BRANCH_NAME

git commit --allow-empty -m $'Empty Commit.\n\nCo-authored-by: '"$AUTHOR_NAME"' <'"$AUTHOR_EMAIL"'>'

git push -u origin $BRANCH_NAME

gh pr create -f -B main

gh pr merge -md

gh repo delete $REPO_NAME --yes
