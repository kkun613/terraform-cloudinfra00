resource "null_resource" "Generalize_web1_1" {
  provisioner "local-exec" {
    command = "az vm deallocate --resource-group 02-ysjang-rg --name ysjang-web1"
  }
  depends_on = [null_resource.Generalize_web1_vm]
}

resource "null_resource" "Generalize_web1_delay" {
  provisioner "local-exec" {
    command = "ping 127.0.0.1 -n 31 > nul"
  }
  depends_on = [null_resource.Generalize_web1_1]
}

resource "null_resource" "Generalize_web1_2" {
  provisioner "local-exec" {
    command = "az vm generalize --resource-group 02-ysjang-rg --name ysjang-web1"
  }
  depends_on = [null_resource.Generalize_web1_delay]
}

resource "null_resource" "Generalize_web1_delay2" {
  provisioner "local-exec" {
    command = "ping 127.0.0.1 -n 31 > nul"
  }
  depends_on = [null_resource.Generalize_web1_delay]
}

resource "null_resource" "Generalize_web1_vm" {
  provisioner "local-exec" {
    command = "ping 127.0.0.1 -n 121 > nul"
  }
  depends_on = [azurerm_linux_virtual_machine.ysjang_web1]
}