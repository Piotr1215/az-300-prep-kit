#!/bin/bash

# Setup variables
group='deletemeresourcegrppls1'
vm='deleteme-vm2'

groupExists=$(az group exists -n $group)

if $groupExists ; then
    echo 'Group' $group already exists
else
    az group create --name $group --location westeurope --output json
    echo 'success'
fi

# Create linux ubuntu VM
az vm create \
  --resource-group $group \
  --name $vm \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys

# Open port 80 for web traffic
az vm open-port --port 80 --resource-group $group --name $vm

ip=$(az vm list-ip-addresses -g $group -n $vm --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" -o tsv)
echo 'Puclic is is:' $ip
# Install nginx
# ssh azureuser@$ip
# sudo apt-get -y update
# sudo apt-get -y install nginx
