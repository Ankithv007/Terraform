output "s3_bucket_name" {
  description = "The S3 bucket name for Terraform state storage"
  value       = aws_s3_bucket.state_storage.id
}

output "dynamodb_table_name" {
  description = "The DynamoDB table name for Terraform state locking"
  value       = aws_dynamodb_table.state_lock.name
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example_ec2.id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.example_ec2.public_ip
}

