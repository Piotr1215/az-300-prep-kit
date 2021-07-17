#!/bin/bash

# Provide initial variables
read -p 'Enter resource group name: ' group
read -p 'Enter virtual machine name: ' vm
read -p 'Enter location for the resources:' location

# Check if variables are provided and exit if not
if [ -z "$group" ] || [ -z "$vm" ] || [ -z "$location" ]; then
    echo "Provide resource group vm names as well as prefered location"
    exit 0
fi

# Check if rg already exists
groupExists=$(az group exists -n "$group")

if $groupExists; then
    echo "Resource group $group already exists"
    exit 0
else
    az group create --name "$group" --location "$location" --output json
    echo "Resource group $group succesfully created in $location"
fi

# Create linux ubuntu VM
echo "Creating vm $vm in resource group $group"

az vm create \
    --resource-group "$group" \
    --name "$vm" \
    --image UbuntuLTS \
    --admin-username azureuser \
    --custom-data sample-webapp.sh \
    --generate-ssh-keys

# Open port 8000 to expose sample webapp created using clouod init script
az vm open-port --port 8000 --resource-group "$group" --name "$vm"

# Obtain public IP to connect to VM
ip=$(az vm list-ip-addresses -g "$group" -n "$vm" --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" -o tsv)

echo "VM succefully created, ssh keys have been generated"
echo "To login to vm run: ssh azureuser@$ip"
echo "To remove resource group with vm run: az group delete --name $group"
