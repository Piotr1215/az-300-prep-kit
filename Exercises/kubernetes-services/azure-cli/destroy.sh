#!/bin/bash

set -x

# variables
group=aks-lab
region=westeurope

# Local variables
CLUSTER_RESOURCES_GROUP='MC_'$group'_aks-cluster_'$region

# Delete aks resource group and cluster itself
echo 'Removing main group with the cluster '$group
az group delete --name $group --yes

# Delete aks vms and other support resources
echo 'Removing support group '$CLUSTER_RESOURCES_GROUP
az group delete --name $CLUSTER_RESOURCES_GROUP --yes
