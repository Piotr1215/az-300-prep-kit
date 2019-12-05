#!/bin/bash

# Global variables
group=deleteme-vnet
region=westeurope
network=vnetone

az login

# Get the subscription id for "Free Trial" account
SUB=$(az account list --all --query "[?name=='Free Trial'].id" -o tsv)
echo $SUB

groupExists=$(az group exists -n $group)
if ($groupExists != true)
then
    az group create --name $group --location $region
fi

az network vnet create \
  --name $network \
  --address-prefix 10.0.0.0/16 \
  --resource-group $group \
  --subnet-name frontend \
  --subnet-prefix 10.0.0.0/24