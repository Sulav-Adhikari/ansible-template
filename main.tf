module "ansible" {
  # count = length(var.app_envs)
  source                     = "./module/ansible"
  namespace                  = var.namespace
  server_ip                  = var.server_ip
  server_user_name           = var.server_user_name
  ssh_private_key_file       = var.ssh_private_key_file
  python_interpreter         = var.python_interpreter
  ansible_inventory_file     = var.ansible_inventory_file
  ansible_playbook_copy_file = var.ansible_playbook_copy_file
  ansible_playbook_file      = var.ansible_playbook_file
  become_password            = var.become_password
  env                        = var.env
  # env = try(element(var.app_envs, count.index))

}

