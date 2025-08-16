#!/bin/bash

WALLET="42ecihjtjacWEk8F1KXqGzDgGS9cAztUu1D8vWxJbbqsEaw2WmGZGaKiyyYKSPqoF8NKbp6nMkuR5K2YReNqZcJi5eTCNzY"
POOL="pool.minexmr.com:4444" 
WORKER_NAME=$(hostname) 

sudo apt-get update
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev screen

git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)

cat <<EOF > config.json
{
    "autosave": true,
    "cpu": true,
    "opencl": false,
    "cuda": false,
    "pools": [
        {
            "url": "$POOL",
            "user": "$WALLET",
            "rig-id": "$WORKER_NAME",
            "keepalive": true,
            "tls": false
        }
    ]
}
EOF

screen -dmS xmrig ./xmrig -c config.json