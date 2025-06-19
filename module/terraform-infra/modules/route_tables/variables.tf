variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming"
  type        = string
}

variable "public_subnet_ids_map" {
  description = "Map of public subnet IDs (static keys required)"
  type        = map(string)
}

variable "private_subnet_ids_map" {
  description = "Map of private subnet IDs (static keys required)"
  type        = map(string)
}
