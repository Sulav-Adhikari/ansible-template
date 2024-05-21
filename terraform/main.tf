terraform {
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
  }
}



resource "ansible_host" "vms" {          #### ansible host details
  name = "192.168.122.16"
  groups = ["vms"]
  variables = {
    ansible_user                 = "sulav",
    ansible_ssh_private_key_file = "~/.ssh/id_rsa",
    ansible_python_interpreter   = "/usr/bin/python3"
  }
}

