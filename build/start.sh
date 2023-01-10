#!/bin/bash

# Get JWT Token
JWT_SECRET="/home/erigon/jwt.hex"
until $(curl --silent --fail "http://dappmanager.my.ava.do/jwttoken.txt" --output "${JWT_SECRET}"); do
  echo "Waiting for the JWT Token"
  sleep 5
done

exec erigon \
  --authrpc.addr 0.0.0.0 \
  --authrpc.jwtsecret=${JWT_SECRET} \
  --authrpc.port=8551 \
  --authrpc.vhosts=* \
  --chain=${NETWORK} \
  --datadir=/home/erigon \
  --externalcl \
  --http \
  --http.addr=0.0.0.0 \
  --http.api=eth,debug,net,trace,web3,erigon \
  --http.corsdomain=* \
  --http.port=8545 \
  --http.vhosts=* \
  --metrics \
  --metrics.addr=0.0.0.0 \
  --metrics.port=6060 \
  --port=30303 \
  --pprof \
  --pprof.addr=0.0.0.0 \
  --pprof.port=6061 \
  --private.api.addr=0.0.0.0:9090 \
  --prune.r.before=11052984 \
  --prune htc \
  --torrent.port=42069 \
  --ws \
  ${EXTRA_OPTs}
