#!/usr/bin/env bash

# return one result from peertube site video api
# ./find-id.sh 777

if [ "$(which wget)" == "" ]; then
  apt install wget;
fi
if [ "$(which jq)" == "" ]; then
  apt install jq;
fi

QUERY="$@"; # 777
PEERTUBE_URL="https://troo.tube";
data=$(wget -q "${PEERTUBE_URL}/api/v1/videos/${QUERY}" -O -);
one=$(echo $data | jq -r .id,.uuid,.name);
echo -e $one;
