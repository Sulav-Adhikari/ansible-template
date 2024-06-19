variable "env" {
  description = "The environment to deploy to (dev, prod, staging)"
  type        = list(string)
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

variable "ansible_playbook_copy_file" {
  description = "Path to the Ansible playbook file"
  type        = string
}

variable "ansible_playbook_file" {
  description = "Path to the Ansible playbook file"
  type        = string
}

variable "namespace" {
  description = "Namespace (e.g `template`)"
  type        = string
}

variable "become_password" {
  description = "sudo password"
  type        = string
}

variable "runner_for" {
  description = "action runners(eg api,backend,frontend)"
  type        = list(string)
}

variable "github_link" {
  description = "first github repository link"
  type        = string
}

variable "github_action_token" {
  description = "first github repository action token"
  type        = string
}

variable "github_link2" {
  description = "second repo link"
  type = string
}

variable "github_action_token2" {
  description = "second github repository action token"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}


variable "server_port" {
  description = "server_port"
  type        = string
}

variable "host" {
  description = "tarefik host"
  type        = string
}

variable "network" {
  description = "Name of network for docker"
  type        = string
}



# variable "app_environment" {
#   description = "Environment for application i.e dev, qa , prod" # directly passed form null_resource set_env2
#   type = string
# }

# variable "service_name" {

#   description = "Name of service for docker" # directly passed from null_resource set_env2
#   type = string
# }







