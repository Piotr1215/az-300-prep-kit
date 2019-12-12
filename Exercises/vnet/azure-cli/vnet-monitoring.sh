#!/bin/bash

# Global variables
rg=deleteme-vnet-monitoring
region=westeurope
network=vnetone
randompw=$(openssl rand -base64 10)

echo $randompw

rgExists=$(az group exists -n $rg)

if $rgExists ; then
    echo 'Group' $rg already exists
else
    az group create --name $rg --location $region --output json
    echo 'Group ' $rg ' created'
fi

# Create vnet
az network vnet create \
    --resource-group $rg \
    --name $network \
    --address-prefix 10.10.0.0/16 \
    --subnet-name FrontendSubnet \
    --subnet-prefix 10.10.1.0/24 \
    --location $region

# Create first VM
az vm create \
    --resource-group $rg \
    --no-wait \
    --name FrontendVM \
    --location $region \
    --vnet-name $network \
    --subnet FrontendSubnet \
    --image Win2012R2Datacenter \
    --admin-username azureuser \
    --admin-password $randompw

# Create backend subnet
az network vnet subnet create \
    --address-prefixes 10.10.2.0/24 \
    --name BackendSubnet \
    --resource-group $rg \
    --vnet-name $network

# Deploy VM to backend subnet
az vm create \
    --resource-group $rg \
    --no-wait \
    --name BackendVM \
    --location $region \
    --vnet-name $network \
    --subnet BackendSubnet \
    --image Win2012R2Datacenter \
    --admin-username azureuser \
    --admin-password $randompw

# Create network security group
az network nsg create \
    --name MyNsg \
    --resource-group $rg \
    --location $region

# Change nsg rule introducing random error
az network nsg rule create \
    --resource-group $rg \
    --name MyNSGRule \
    --nsg-name MyNsg \
    --priority 4096 \
    --source-address-prefixes 10.10.2.0/24 \
    --source-port-ranges 80 443 3389 \
    --destination-address-prefixes '*' \
    --destination-port-ranges 80 443 3389 \
    --access Deny \
    --protocol TCP \
    --description "Deny from specific IP address ranges on 80, 443 and 3389."

# Associate nsg with backend subnet
az network vnet subnet update \
    --resource-group $rg \
    --name BackendSubnet \
    --vnet-name $network \
    --network-security-group MyNsg

# Make sure network watcher is enabled in chosen region
az network watcher configure \
    --resource-group $rg \
    --locations $region \
    --enabled