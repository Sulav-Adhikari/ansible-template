module "ansible" {
  source         = "./module/ansible"
  env                      = var.env
  server_ip                = var.server_ip
  server_user_name         = var.server_user_name
  ssh_private_key_file     = var.ssh_private_key_file
  python_interpreter       = var.python_interpreter
  ansible_inventory_file   = var.ansible_inventory_file
  ansible_playbook_file    = var.ansible_playbook_file

}

  
  # ansible_inventory_file = module.ansible.ansible_inventory_file
  # ansible_playbook_file  = module.ansible.ansible_playbook_file