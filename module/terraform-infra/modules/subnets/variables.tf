variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "private_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}
