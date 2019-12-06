#!/bin/bash

# Setup variables
group='deleteme-rg'

groupExists=$(az group exists -n $group)

if $groupExists ; then
    echo 'Group' $group already exists
else
    az group create --name $group --location westeurope --output json
    echo 'success'
fi