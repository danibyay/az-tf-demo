resource "azurerm_network_interface" "demo-nic" {
    count = length(var.vm-name-prefix)
    name = "${var.vm-name-prefix[count.index]}-nic"
    location = var.location
    resource_group_name = data.azurerm_resource_group.daniela-rg.name

    ip_configuration { 
        name = "internal"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }

    /* tags = {
        Project = "dou university"
        Date created = "friday may 7th"
    } */
}

resource "azurerm_virtual_machine" "demo-vm" {
    count = length(var.vm-name-prefix) # 2
    name = "${var.vm-name-prefix[count.index]}-nic" #-vm
    location = var.location
    resource_group_name = data.azurerm_resource_group.daniela-rg.name
    vm_size = var.vm_size
    network_interface_ids = [azurerm_network_interface.demo-nic[count.index].id]
    delete_os_disk_on_termination = true 
    delete_data_disks_on_termination = true 
    # availability_set_id
    os_profile {
    computer_name  = var.vm-name-prefix[count.index]
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/${var.admin_user}/.ssh/authorized_keys"
      key_data = tls_private_key.vm_key.public_key_openssh
    }
    #ssh_keys {
    #  path     = "/home/${var.admin_user}/.ssh/authorized_keys"
    #  key_data = file("~/.ssh/id_rsa.pub")
    #}
  }
  storage_os_disk {
    name          = "${var.vm-name-prefix[count.index]}-osdisk"
    disk_size_gb  = 65
    caching       = "ReadWrite"
    create_option = "FromImage"
    #create_option = "Attach"
    managed_disk_type = "Standard_LRS"
  }
  /*storage_data_disk {
    name          = "${var.vm-name-prefix[count.index]}-vmdisk1"
    caching       = "ReadWrite"
    #create_option = "FromImage"
    create_option = "Attach"
    disk_size_gb  = 256
    lun           = 0
  }*/
  storage_image_reference {
    #id = data.azurerm_image.qvc_base_image_east.id
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  tags = {
    "Name" = "Terraform Example jajaja"
    "Team" = "DOUniversity"
    "Owner" = "Daniela/Monserrat"
  }

}


resource "tls_private_key" "vm_key" {
    algorithm =  "RSA"
    rsa_bits   = 4096
}

