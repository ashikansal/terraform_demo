output "vm_identity" {
  value = azurerm_virtual_machine.test_vm.identity.0.principal_id
}

