#!/usr/bin/env bash

# return two results from peertube site search api, used for checking if duplicate videos have been imported into the site

if [ "$(which wget)" == "" ]; then
  apt install wget;
fi
if [ "$(which jq)" == "" ]; then
  apt install jq;
fi

QUERY="$@";
PEERTUBE_URL="https://troo.tube";
data=$(wget -q "${PEERTUBE_URL}/api/v1/videos/${QUERY}" -O -);
one=$(echo $data | jq -r .id,.uuid,.name);
echo -e $one;
