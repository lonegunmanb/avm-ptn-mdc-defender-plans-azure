#!/bin/bash

echo  $ARM_TENANT_ID
echo  $ARM_SUBSCRIPTION_ID
echo  $ARM_CLIENT_ID
echo  $ARM_OIDC_REQUEST_TOKEN
echo  $ARM_OIDC_REQUEST_URL
echo $ARM_USE_OIDC

# Check if ARM_SUBSCRIPTION_ID is set
if [ -z "$ARM_SUBSCRIPTION_ID" ]; then
  echo "You need to set the ARM_SUBSCRIPTION_ID environment variable to run this script."
  exit 1
fi

# Define variables
MODULE_ROOT="../"
EXAMPLE_PATH="examples/default"
PLANS=("AppServices" "Arm" "Containers" "KeyVaults" "OpenSourceRelationalDatabases" "SqlServers" "SqlServerVirtualMachines" "CosmosDbs" "StorageAccounts" "Api" "VirtualMachines")

# Create a temporary directory and copy the Terraform folder
TMP_FOLDER=$(mktemp -d)
cp -r "$MODULE_ROOT"/* "$TMP_FOLDER"

# Initialize Terraform
cd "$TMP_FOLDER/$EXAMPLE_PATH" || exit
terraform init

# Import existing plans
for PLAN in "${PLANS[@]}"; do
  terraform import "module.mdc_plans_enable.azurerm_security_center_subscription_pricing.asc_plans[\"$PLAN\"]" "/subscriptions/$ARM_SUBSCRIPTION_ID/providers/Microsoft.Security/pricings/$PLAN"
done

# Destroy the imported resources
terraform destroy -auto-approve

# Clean up
rm -rf "$TMP_FOLDER"
