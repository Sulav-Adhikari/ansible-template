variable "server_ip" {
  type    = string
  default = "192.168.122.70"

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
  default     = ["dev","prod"]
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


variable "runner_for" {
  description = "action runners(eg api,backend,frontend)"
  default     = ["frontend","backend"]
}


variable "project_name" {
  description = "Project Name"
  default     = "glo"
}

variable "server_port" {
  description = "server_port"
  default     = "80"
}

variable "host" {
  description = "traefik host"
  default     = "dev.gloschool.org"
}

variable "network" {
  description = "Name of network for docker"
  default     = "app"

}

variable "github_link" {
  description = "project's github repository link"
  default     = "https://github.com/Sulav-Adhikari/npx"
}

variable "github_action_token" {
  description = "project's github repository action token"
  default     = "AOL7E2MIX3JTNSLCDXDJGTDGOFYDK"
}


variable "github_link2" {
  description = "second repo link"
  default = "https://github.com/Sulav-Adhikari/frontendCICD"
}

variable "github_action_token2" {
  description = "second github repository action token"
  default = "AOL7E2M4LO7R6QQS3UBPSMTGOFYCY"
}

# variable "service_name" {
#   description = "Name of service for docker" # directly passed from null_resource set_env2de  
#   default     = ""

# }

# variable "app_environment" {
#   description = "Environment for application i.e dev, qa , prod" # directly passed form null_resource set_env2 
#   default     = ""
# }