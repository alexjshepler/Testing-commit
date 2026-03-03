#!/usr/bin/env bash

# Usage:
# ./generate_commits.sh 50
# ./generate_commits.sh 50 myfile.txt

COUNT=${1:-10}
FILE=${2:-commits.txt}

if [ ! -d ".git" ]; then
  git init
fi

touch "$FILE"

for ((i=1; i<=COUNT; i++)); do
  echo "Commit #$i - $(date +%s%N) - $RANDOM" >> "$FILE"
  git add "$FILE"
  git commit -m "Auto commit #$i"
done

echo "Created $COUNT commits."

