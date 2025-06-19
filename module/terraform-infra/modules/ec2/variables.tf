variable "name_prefix" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "bastion_sg_id" {
  type = string
}
variable "app_sg_id" {
  type = string
}
variable "public_subnet_ids_map" {
  type = map(string)
}
variable "private_subnet_ids_map" {
  type = map(string)
}
