output "bastion_sg_id" {
  value       = aws_security_group.bastion_sg.id
  description = "Security group ID for bastion"
}

output "app_sg_id" {
  value       = aws_security_group.app_sg.id
  description = "Security group ID for app EC2"
}
