#!/bin/bash
token=$(cat .token)
vault  login $token > /dev/null
vault token renew -increment=768h  $token > /dev/null
[[ $0 = /* ]] && script=$0 || script=$PWD/$0
at -f "$script" 'now + 767 hours'  &>/dev/null
