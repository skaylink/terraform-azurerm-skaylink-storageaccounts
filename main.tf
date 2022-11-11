# A Terraform module to create a subset of cloud components
# Copyright (C) 2022 Skaylink GmbH

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# For questions and contributions please contact info@iq3cloud.com

resource "azurerm_storage_account" "sa" {
  for_each = var.storage_accounts

  name                            = each.value.storage_account_name
  location                        = data.azurerm_resource_group.rg[each.key].location
  resource_group_name             = data.azurerm_resource_group.rg[each.key].name
  account_tier                    = "Standard"
  account_replication_type        = "ZRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = each.value.environment_name
  }
}

resource "azurerm_storage_container" "container" {
  for_each              = var.storage_accounts
  storage_account_name  = each.value.storage_account_name
  container_access_type = "blob"
  name                  = each.value.container_name

  depends_on = [
    azurerm_storage_account.sa,
  ]
}
