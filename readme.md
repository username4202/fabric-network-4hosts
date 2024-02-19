Hyperledger Fabric v2.2 Multi Host Test

env :
- Hyperledger Fabric v2.2
- Go 1.17
- Docker 20.10
- Ubuntu 20.04

Domain : example.com

Ordering : Raft-Ordering

Node Setting : "container":"port"

- Host1 : orderer.example.com:7050, orderer1.example.com:8050, peer0.org1.example.com:7051, peer1.org1.example.com:8051, cli
- Host2 : orderer2.example.com:9050, peer0.org2.example.com:9051, peer1.org2.example.com:10051

Anchor peer : peer0.org1, peer0.org2

Init :
 
1. docker network link to Host1 and Host2 with docker swarm

2. Host1 : ./host1up.sh, Host2 : ./host2up.sh

3. channel : Host1 : ./channelup.sh

referenece

- https://kctheservant.medium.com/multi-host-deployment-for-first-network-hyperledger-fabric-v2-273b794ff3d
- https://hyperledger-fabric.readthedocs.io/en/release-2.2
