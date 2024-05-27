# terraform {
#   required_providers {
#     ansible = {
#       source = "ansible/ansible"
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
#     inventory_file               = "./inventory.yml" ## path must be in accordance the directory from where terraform apply is executed
#     playbook_file                = "../main.yml"     ## path must be in accordance the directory from where terraform apply is executed
#   }
# }