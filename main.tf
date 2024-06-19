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
  runner_for                 = var.runner_for
  github_link                = var.github_link
  github_link2               = var.github_link2
  github_action_token        = var.github_action_token
  github_action_token2        = var.github_action_token2
  project_name               = var.project_name
  host                       = var.host
  network                    = var.network
  server_port                = var.server_port

  # env = try(element(var.app_envs, count.index))

}

