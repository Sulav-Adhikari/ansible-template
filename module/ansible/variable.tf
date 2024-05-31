variable "env" {
  description = "The environment to deploy to (dev, prod, staging)"
  type        = string
}

variable "server_ip" {
  description = "Server IP address"
  type        = string
}

variable "server_user_name" {
  description = "Server username"
  type        = string
}

variable "ssh_private_key_file" {
  description = "Path to the SSH private key file"
  type        = string
}

variable "python_interpreter" {
  description = "Path to the Python interpreter"
  type        = string
}

variable "ansible_inventory_file" {
  description = "Path to the Ansible inventory file"
  type        = string
}

variable "ansible_playbook_file" {
  description = "Path to the Ansible playbook file"
  type        = string
}
