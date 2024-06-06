terraform {
  required_providers {
    ansible = {
      source = "ansible/ansible"
    }
  }
}



resource "ansible_host" "ec2-instance" { #### ansible host details
  name   = var.server_ip                 ### VM ip address 
  groups = ["ec2-instance"]              ### name defined in hosts of ansible (ansible/inventories/hosts)
  variables = {
    become_password              = "${var.become_password}",
    env                          = join(",", var.env), ### convert list to string
    project_names                = "${var.namespace}",
    ansible_user                 = "${var.server_user_name}", ### VM username
    ansible_ssh_private_key_file = "${var.ssh_private_key_file}",
    ansible_python_interpreter   = "${var.python_interpreter}"
    inventory_file               = "${var.ansible_inventory_file}"     ## path must be in accordance the directory from where terraform apply is executed
    playbook_file_copy           = "${var.ansible_playbook_copy_file}" ## path must be in accordance the directory from where terraform apply is executed
    ansible_playbook_file        = "${var.ansible_playbook_file}"
  }
}


resource "null_resource" "set_env" {
  count = length(var.env)
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOT
      echo 'APP_ENVIRONMENT: "${element(var.env, count.index)}"' > ${path.module}/../../ansible_configuration/env.${element(var.env, count.index)}.yaml
      echo 'SERVER_PORT: "80"' >> ${path.module}/../../ansible_configuration/env.${element(var.env, count.index)}.yaml
      echo 'API_LINK: "devops+api@gmail.com"' >> ${path.module}/../../ansible_configuration/env.${element(var.env, count.index)}.yaml
      echo 'NETWORK: "app"' >> ${path.module}/../../ansible_configuration/env.${element(var.env, count.index)}.yaml
      echo 'SERVICE_NAME: "${var.namespace}_${element(var.env, count.index)}"' >> ${path.module}/../../ansible_configuration/env.${element(var.env, count.index)}.yaml
    EOT
  }
}



resource "null_resource" "copy_directory_and_template" {
  count = length(var.env)
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "ANSIBLE_ENV=${element(var.env, count.index)} ansible-playbook -i ${var.ansible_inventory_file} ${var.ansible_playbook_copy_file} --extra-vars 'ansible_become_pass=${var.become_password}'"

  }
}



resource "null_resource" "action_runner" {
  triggers = {
    always_run = "${timestamp()}"
  } 
  provisioner "local-exec" {
    command = "ansible-playbook -i ${var.ansible_inventory_file} ${var.ansible_playbook_file} --ask-become-pass"

  }
}


