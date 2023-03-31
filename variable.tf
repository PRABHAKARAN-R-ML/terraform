variable "root_block_size" {
  type        = number
  description = "Size of the root block device"
  default     = 9
}
variable "root_block_type" {
  type        = string
  description = "root block device type"
  default     = "gp2"
}
variable "ebs_block_size" {
  type        = number
  description = "Size of the ebs block device"
  default     = 2
}
variable "ebs_block_type" {
  type        = string
  description = "Size of the ebs block type"
  default     = "gp2"
}

variable "region" {
  type        = string
  description = "Region name"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  type        = string
  description = "subnet cidr block"
  default     = "10.0.1.0/24"
}
variable "subnet_availabilty_zone" {
  type        = string
  description = "subnet_availablity zone"
  default     = "us-east-1a"
}
variable "Ami_id" {
  type        = string
  description = "Ami id of ec2 instance "
  default     = "ami-00c39f71452c08778"
}
variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t2.micro"
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
  default     = "demo-vpc"
}

variable "public_subnet_name" {
  type        = string
  description = "public_subnet_name"
  default     = "demo-public-subnet"
}
variable "gateway_name" {
  type        = string
  description = "Gateway name"
  default     = "demo-gateway"
}
variable "route_table_name" {
  type        = string
  description = "route table name"
  default     = "demo-public-rwt"
}
