terraform {
  required_providers {
    ansible = {
      source = "ansible/ansible"
    }
  }
}



resource "ansible_host" "vms" { #### ansible host details
  name   = "${var.server_ip}"     ### VM ip address 
  groups = ["vms"]              ### name defined in hosts of ansible (ansible/inventories/hosts)
  variables = {
    ansible_user                 = "${var.server_user_name}", ### VM username
    ansible_ssh_private_key_file = "${var.ssh_private_key_file}",
    ansible_python_interpreter   = "${var.python_interpreter}"
    inventory_file               = "${var.ansible_inventory_file}" ## path must be in accordance the directory from where terraform apply is executed
    playbook_file                = "${var.ansible_playbook_file}"    ## path must be in accordance the directory from where terraform apply is executed
  }
}


resource "null_resource" "provisioner" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {

    command = "ansible-playbook -i ${var.ansible_inventory_file} ${var.ansible_playbook_file} --ask-become-pass"

  }
}