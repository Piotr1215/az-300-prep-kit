#!/bin/bash

# Setup variables
group='deletemeresourcegrppls'
storage='deletemestoragepls'
container='test'

groupExists=$(az group exists -n $group)

echo $groupExists

if $groupExists ; then
    echo 'Group' $group already exists
else
    az group create --name $group --location westeurope --output json
    echo 'success'
fi

# Create general purpose V2 storage account
az storage account create \
    --name $storage \
    --resource-group $group \
    --location westeurope \
    --sku Standard_RAGRS \
    --kind StorageV2
