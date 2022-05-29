# Skaylink Terraform module; Storage Accounts

This module allows you to bulk create storage accounts by supplying a storage account name, container name, resource group and tags.  The SA and container will be created in the same region as the supplied resource group.

## Example
This example shows you how to define the accounts in your variables. You can create as many, or few storage accounts as you want to.

```hcl
storage_accounts = {
  "account1" = {
    storage_account_name     = "storageaccount1"
    container_name           = "container1"
    resource_group_name      = "rg-1"
    environment_name         = "dev"
  },
  "account2" = {
    storage_account_name     = "storageaccount2"
    container_name           = "container2"
    resource_group_name      = "rg-2"
    environment_name         = "staging"
  },
  "account3" = {
    storage_account_name     = "storageaccount3"
    container_name           = "container3"
    resource_group_name      = "rg-3"
    environment_name         = "prod"
  },
}
```