#!/usr/bin/env bash

# return one result from peertube site video api

QUERY="$@";
PEERTUBE_URL="https://troo.tube";
data=$(wget -q "${PEERTUBE_URL}/api/v1/videos/${QUERY}" -O -);
one=$(echo $data | jq -r .id,.uuid,.account.name,.duration,.name);
echo -e $one;
