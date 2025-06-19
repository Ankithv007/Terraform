output "bastion_ips" {
  value       = [for i in aws_instance.bastion : i.public_ip]
  description = "Public IPs of Bastion EC2s"
}

output "app_private_ips" {
  value       = [for i in aws_instance.app : i.private_ip]
  description = "Private IPs of App EC2s"
}
