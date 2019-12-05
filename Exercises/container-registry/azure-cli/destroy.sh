# Global variables
export group=aks-lab
export region=westeurope

# Delete aks resource group and cluster itself
az group delete -n $group

kubectl delete secrets acr-auth