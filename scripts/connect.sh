#!/bin/bash
export VAULT_ADDR="https://10.0.1.1:443"
export VAULT_SKIP_VERIFY="true"
# .token contains vault token to be used for vault login 
vault login $(cat .token)  > /dev/null
kf=$(cat /proc/sys/kernel/random/uuid)
vault kv get -field private-key kv/ssh/$1/$USER  > $kf
chmod 600 $kf
./cleanup.sh  $kf &
ssh -i $kf $1
