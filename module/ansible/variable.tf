variable "server_ip" {
  type = string
  default = "192.168.122.196"
  
}

variable "server_user_name" {
  type = string
  default = "master1"
  
}

variable "ssh_private_key_file" {
  
  type = string
  default = "~/.ssh/id_rsa"
}

variable "python_interpreter" {
  
  type = string
  default = "/usr/bin/python3"
}

variable "ansible_inventory_file" {
  type = string
  default = "./inventory.yml"
  
}

variable "ansible_playbook_file" {
  type = string
  default = "./ansible_configuration/main.yml"
}