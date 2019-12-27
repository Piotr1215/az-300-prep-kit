# Create Azure storage using CLI

## Setup variables

group='deletemeresourcegrppls'
storage='deletemestoragepls'
container='test'

## Create resource group

az group create \
    --name $group \
    --location westeurope

## Create general purpose V2 storage account

az storage account create \
    --name $storage \
    --resource-group $group \
    --location westeurope \
    --sku Standard_RAGRS \
    --kind StorageV2

## Generate Storage Access Signature

az storage container generate-sas \
    --account-name $storage \
    --account-key <Insert key from storage Keys menu> \
    --name $container \
    --permissions acdlrw

### Optional

## Create BlobStorage account

az storage account create \
    --name deletemestorageplsblob \
    --resource-group $group \
    --location westeurope \
    --sku Standard_RAGRS \
    --kind BlobStorage \
    --access-tier Hot

## Destroy

az group delete --name $group
