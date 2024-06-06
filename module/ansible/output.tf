output "env_value" {
  value = ansible_host.ec2-instance.variables.env
}