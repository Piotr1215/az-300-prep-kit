# Global variables
export group=aks-lab
export region=westeurope

# Local variables
NODE_COUNT=3

# Create resource group
az group create -n $group -l $region

# Create AKS cluster
az aks create -g $group -n aks-cluster -l $region \
--node-count $NODE_COUNT --node-vm-size Standard_DS2_v2 \
--kubernetes-version 1.14.8 --verbose

# Set cluster in kubeconfig
az aks get-credentials -g $group -n aks-cluster