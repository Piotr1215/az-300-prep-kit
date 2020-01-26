#!/bin/bash

# variables
group=aks-lab
region=westeurope

# Local variables
CLUSTER_RESOURCES_GROUP='MC_'$group'_aks-cluster_'$region

# Delete aks vms and other support resources
az group delete -n $CLUSTER_RESOURCES_GROUP

# Delete aks resource group and cluster itself
az group delete -n $group