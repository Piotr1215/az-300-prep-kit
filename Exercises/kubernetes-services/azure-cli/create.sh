#!/bin/bash

# Setup variables
group=aks-lab
region=westeurope

# Local variables
NODE_COUNT=3

# Create resource group
az group create -n $group -l $region

# Get latest version of k8s for your region
version=$(az aks get-versions -l "$region" --query 'orchestrators[-1].orchestratorVersion' -o tsv)

# Create AKS cluster on your subscription, without using service principal
az aks create -g $group -n aks-cluster -l $region \
    --node-count $NODE_COUNT \
    --node-vm-size Standard_DS2_v2 \
    --generate-ssh-keys \
    --vm-set-type VirtualMachineScaleSets \
    --enable-cluster-autoscaler \
    --min-count 1 \
    --max-count 3
    --kubernetes-version "$version" --verbose

# Set cluster in kubeconfig
az aks get-credentials -g $group -n aks-cluster