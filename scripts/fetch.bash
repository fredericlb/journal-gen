#!/bin/bash
i=0
while read p; do
  echo "* Converting ${p}"
  curl -H "x-api-key: cJvBa5tSLTRDEa856tdw3BVoYTC8wtJherTszi33" "https://mercury.postlight.com/parser?url=$p" > \
    articles/${SESSION_ID}_${i}.json
  sleep 2;
  ((i++))
done < articles.txt
mv articles.txt sessions/${SESSION_ID}.txt
touch articles.txt
