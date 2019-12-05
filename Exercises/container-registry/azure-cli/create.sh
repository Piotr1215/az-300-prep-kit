# Global variables
export group=aks-lab
export region=westeurope

# Create resource group
az group create -n $group -l $region

ACR_NAME="atosacr"
az acr create -n $ACR_NAME -g $group -l $region --sku Standard --admin-enabled true

ACR_PWD=`az acr credential show -n $ACR_NAME -g $group --query "passwords[0].value" -o tsv`

kubectl create secret docker-registry acr-auth --docker-server $ACR_NAME.azurecr.io --docker-username $ACR_NAME --docker-password $ACR_PWD --docker-email ignore@dummy.com
