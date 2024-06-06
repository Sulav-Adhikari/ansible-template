variable "server_ip" {
  type    = string
  default = "192.168.122.151"

}

variable "server_user_name" {
  type    = string
  default = "sulav"

}

variable "ssh_private_key_file" {

  type    = string
  default = "~/.ssh/id_rsa"
}

variable "python_interpreter" {

  type    = string
  default = "/usr/bin/python3"
}

variable "ansible_inventory_file" {
  type    = string
  default = "./inventory.yml"

}

variable "ansible_playbook_copy_file" {
  type    = string
  default = "./ansible_configuration/main-copyd.yaml"
}
variable "ansible_playbook_file" {
  description = "Path to the Ansible playbook file"
  default     = "./ansible_configuration/main.yml"
}


# variable "app_envs" {
#   type        = list(string)
#   default     = ["dev","staging"]
#   description = "Environment name (e.g., prod, staging, dev , qa ,test)"
# }


variable "env" {
  type        = list(string)
  default     = ["dev", "staging", "prod"]
  description = "Environment name (e.g., prod, staging, dev , qa ,test)"
}

variable "namespace" {
  description = "Namespace (e.g `template`)"
  type        = string
}

variable "become_password" {
  description = "sudo password"
  type        = string
}