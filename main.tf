module "ansible" {
  source         = "./module/ansible"
  
  # ansible_inventory_file = module.ansible.ansible_inventory_file
  # ansible_playbook_file  = module.ansible.ansible_playbook_file

}
