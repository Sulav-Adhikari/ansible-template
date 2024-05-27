# resource "null_resource" "provisioner" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }
#   provisioner "local-exec" {

#     command = "ansible-playbook -i ${var.inventory_file} ${var.playbook_file} --ask-become-pass"

#   }
# }