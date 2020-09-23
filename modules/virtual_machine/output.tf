output "vm_identity" {
  value = azurerm_linux_virtual_machine.test_vm.identity.0.principal_id
}

