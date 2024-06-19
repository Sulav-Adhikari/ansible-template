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


#set common environment variablbes i.e env.yaml

resource "null_resource" "set_env1" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOT
      cat <<EOF > ${path.module}/../../ansible_configuration/env.yaml
      # Env for copy-dir.yaml
      project_name: ${var.project_name}
      project_directory: "{{ env.split(',') }}"
      project_file: [compose.yaml, deploy.sh]
      # Env for selfhostedrunner.yaml
      runner_for: ${jsonencode(var.runner_for)}
      
      repositories:
        npx:
          github_link: "${var.github_link}"
          action_token: "${var.github_action_token}"
        frontendcicd:
          github_link: "${var.github_link2}"
          action_token: "${var.github_action_token2}"
           
        
      EOF
    EOT
    # To add another repository, add another block within the EOF markers
    # e.g., 
    # cat <<EOF >> ${path.module}/../../ansible_configuration/env.yaml
    #   glo2:
    #     github_link: "${var.github_link2}"          #also set terraform variables github_link2 in module/ansible/variable.tf and root variable.tf
    #     action_token: "${var.github_action_token2}" #also set terraform variables action_token2 in module/ansible/variable.tf and root variable.tf
    # EOF

  }

}



# ## Set environment specific variable i.e env.dev.yaml , env.qa.yaml

resource "null_resource" "set_env2" {
  count = length(var.env)
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOT
      cat <<EOF > ${path.module}/../../ansible_configuration/env.${element(var.env, count.index)}.yaml
      APP_ENVIRONMENT: "${element(var.env, count.index)}"
      SERVER_PORT: "${var.server_port}"
      HOST: "${var.host}"
      NETWORK: "${var.network}"
      SERVICE_NAME: "${var.project_name}_${element(var.env, count.index)}"
      EOF
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



# resource "null_resource" "action_runner" {
#   triggers = {
#     always_run = "${timestamp()}"
#   } 
#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${var.ansible_inventory_file} ${var.ansible_playbook_file} --ask-become-pass"

#   }
# }


