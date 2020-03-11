#!/usr/bin/env ash

datadir=/private/.ethereum_pow/
addresses="0x0Cbbb79B02449ea575F6185dd3C541E9ab8d8182"

sleep 20

geth attach $datadir/geth.ipc
     --mine
     --minerthreads=1
     --etherbase=$addresses
