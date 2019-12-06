#!/bin/bash

# Setup variables
group='deleteme-rg'

groupExists=$(az group exists -n $group)

if $groupExists; then
    echo 'Group' $group 'already exists'
else
    az group create --name $group --location westeurope --output json
    echo 'Resource group' $group 'created.'
fi

delete=${1:-false}

if $delete; then

    groupExists=$(az group exists -n $group)

    if $groupExists; then
        az group delete --name $group --yes
        echo 'Resource group' $group 'destroyed'
    else
        echo 'Group' $group 'not found'
    fi
fi