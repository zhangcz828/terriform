#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: remote-state.sh <resource group name> <storage account name> <container name>"
  exit 1
fi
RESOURCE_GROUP_NAME=$1
[ -z $RESOURCE_GROUP_NAME ] && RESOURCE_GROUP_NAME="demo-rg"
STORAGE_ACCOUNT_NAME=$2
[ -z $STORAGE_ACCOUNT_NAME ] && STORAGE_ACCOUNT_NAME="demo$RANDOM"
CONTAINER_NAME=$3
[ -z $CONTAINER_NAME ] && CONTAINER_NAME="tfstate"

az group list -o table | grep -w $RESOURCE_GROUP_NAME >/dev/null
if [ $? -eq 0 ]; then
  echo "$RESOURCE_GROUP_NAME is exist"
else
	# Create resource group
	az group create --name $RESOURCE_GROUP_NAME --location "West Europe"
fi

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)
# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
echo ""
echo "resource group name: $RESOURCE_GROUP_NAME"
echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
