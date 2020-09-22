resource "azurerm_virtual_network" "test_vnet" {
  address_space = var.vnet_address_space
  location = var.location
  name = "${var.prefix}-vnet"
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "test_subnet" {
  name = "${var.prefix}-subnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.test_vnet.name
  address_prefixes = var.subnet_address_prefixes
}

resource "azurerm_network_interface" "test_nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.test_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}