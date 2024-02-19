docker rm -f $(docker ps -aq)
docker volume prune -y

export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}

rm -rf ./crypto-config/*
rm -rf ./channel-artifacts/*

../bin/cryptogen generate --config=./crypto-config.yaml

../bin/configtxgen -profile SampleMultiNodeEtcdRaft -channelID system-channel -outputBlock ./channel-artifacts/genesis.block

../bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel1.tx -channelID channel1

../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID channel1 -asOrg Org1MSP

../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID channel1 -asOrg Org2MSP



