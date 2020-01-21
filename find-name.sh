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
data=$(wget -q "${PEERTUBE_URL}/api/v1/search/videos?start=0&count=2&sort=-match&search=${QUERY}" -O -);
one=$(echo $data | jq -r .data[0].id,.data[0].uuid,.data[0].name);
two=$(echo $data | jq -r .data[1].id,.data[1].uuid,.data[1].name);
if [ "$(echo $one | awk '{print $1}')" == "null" ]; then echo ""; else echo -e $one; fi;
if [ "$(echo $two | awk '{print $1}')" == "null" ]; then echo ""; else echo -e $two; fi;
