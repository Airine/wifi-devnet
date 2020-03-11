#!/usr/bin/env ash

datadir=/private/.ethereum_pow/
addresses="0x356Cf535FC1f1C4dD1a4C4f4c261684bcd3e1bcb,0x59Ef5B8b24cE3e00Ad0345cD2d47f96947c3e2c3,0x4B54772Cc9e233B4fe1F04A65a994aF40A6834ac,0xF7e5800E52318834E8689c37dCCCD2230427a905,0xC9c4496508E92A9FCB0Ffc8Cb6363f910C7E8AE3,0x6c319A49787d10a6e0c72a25DB06cc555370c4DD,0x9E9581516679F57Aa7eb81D278841DF6aB93902B,0x71b3D7405080197fC03cA82bCDd1764F1e14ABf2,0x0Cbbb79B02449ea575F6185dd3C541E9ab8d8182,0x563A5fC36b990D68bBCaAA206C281BfEc31134AB"

geth init --datadir $datadir /genesis/genesis.json

mkdir -p $datadir/keystore
cp -R /keystore $datadir

geth --datadir $datadir \
     --networkid "19990102" \
     --rpc --rpcaddr '0.0.0.0' --rpcport 7545 --rpccorsdomain '*' --rpcapi 'admin,db,eth,miner,net,web3,personal,txpool' \
     --ws --wsaddr '0.0.0.0' --wsport 7546 --wsorigins '*' \
     --unlock $addresses \
     --password "/dev/null" \
     --verbosity 3
     --mine
     --minerthreads=1
     --etherbase=0x0Cbbb79B02449ea575F6185dd3C541E9ab8d8182
