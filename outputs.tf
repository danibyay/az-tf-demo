output "tls_private_key" {
    value = tls_private_key.vm_key.private_key_pem
}

output "vm_id" {
  value = azurerm_virtual_machine.demo-vm[*].id
}