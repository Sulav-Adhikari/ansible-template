output "inventory_file" {
  value = ansible_host.vms.variables.inventory_file
}

output "playbook_file" {
  value = ansible_host.vms.variables.playbook_file
}