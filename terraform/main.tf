module "ansible_host" {
  source = "./modules/ansible_host"

}

module "provisioner" {
  source         = "./modules/provisioner"
  inventory_file = module.ansible_host.inventory_file
  playbook_file  = module.ansible_host.playbook_file
}





# terraform {
#   required_providers {
#     ansible = {
#       source  = "ansible/ansible"
#       version = "~> 1.3.0"


#     }
#   }
# }

# resource "ansible_host" "vms" { #### ansible host details
#   name   = "192.168.122.16"     ### VM ip address 
#   groups = ["vms"]              ### name defined in hosts of ansible (ansible/inventories/hosts)
#   variables = {
#     ansible_user                 = "sulav", ### VM username
#     ansible_ssh_private_key_file = "~/.ssh/id_rsa",
#     ansible_python_interpreter   = "/usr/bin/python3"
#     inventory_file               = "./inventory.yml"
#     playbook_file                = "../main.yml"
#   }
# }

#   #  provisioner "ansible" {
#   #       command = "ansible-playbook"
#   #       playbook_file = "../main.yml"
#   #       inventory_file_template = "inventory.yml"

#   # }


#   # resource "ansible_playbook" "playbook" {
#   #   playbook = ansible_host.vms.variables["playbook_file"]
#   #   name     = "Execute Main Playbook"


#   # }

#   resource "null_resource" "provisioner" {
#     triggers = {
#       always_run = "${timestamp()}"
#     }
#     provisioner "local-exec" {

#       command = "ansible-playbook -i '${ansible_host.vms.variables["inventory_file"]}' ${ansible_host.vms.variables["playbook_file"]} --ask-become-pass"

#     }
#   }



