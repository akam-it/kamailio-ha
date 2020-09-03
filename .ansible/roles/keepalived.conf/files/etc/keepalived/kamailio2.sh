#!/bin/bash

kamailio1="192.168.51.11"
kamailio2="192.168.51.12"
return_code=1 # fail

# check kamailio1
timeout 2 sipsak -s sip:$kamailio1:5050
exit_status=$?
if [[ $exit_status -eq 0 ]]; then
  echo "sip ping successful to kamailio1 [$kamailio1]"
  exit $return_code
fi

# check node
timeout 2 sipsak -s sip:$kamailio2:5050
exit_status=$?
if [[ $exit_status -eq 0 ]]; then
  echo "sip ping successful to kamailio2 [$kamailio2]"
  return_code=0
fi

echo "return code [$return_code]"

exit $return_code
