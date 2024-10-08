variable "vpc_id" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "prefix" {
  type = string
}

variable "name" {
  type        = string
  description = "The name to be interpolated, defaults to bastion-ssm-iam"
  default     = "bastion-ssm-iam"
}

variable "log_retention" {
  type        = number
  description = "The amount of days the logs need to be kept"
  default     = 90
}

variable "number_of_bastions" {
  type    = number
  default = 1
}

variable "security_group_ids" {
  type    = list(any)
  default = []
}

variable "ami_name" {
  type        = string
  description = "The ami name"
  default     = "diso-devops/bastion/ubuntu-jammy-22.04-amd64-server-generic-*"
}

variable "ami_owners" {
  type        = list(any)
  description = "The owning AWS Account ID of the ami."
}

variable "assume_role" {
  type        = string
  description = "The name for the role the instance assumes for S3 bucket access"
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}
