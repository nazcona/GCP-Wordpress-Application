variable "billing_acct" {
  description = "Please provide billing account name"
  type        = string
}

variable "region" {
  default = "us-central1"
  description = "Please provide a region to build a VPC"
  type = string
}

variable "project_name" {
  description = "Please provide project name"
  type = string
  default = "gcp-project"
}

variable "public1_cidr" {
    description = "Provide Public1 Subnet IP cidr range"
    type = string
    default = "10.0.1.0/16"
}

variable "public2_cidr" {
    description = "Provide Public2 Subnet IP cidr range"
    type = string
    default = "10.0.2.0/16"
}

variable "public3_cidr" {
    description = "Provide Public3 Subnet IP cidr range"
    type = string
    default = "10.0.3.0/16"
}

variable "private1_cidr" {
    description = "Provide Private1 Subnet IP cidr range"
    type = string
    default = "10.0.101.0/16"
}

variable "private2_cidr" {
    description = "Provide Private2 Subnet IP cidr range"
    type = string
    default = "10.0.102.0/16"
}

variable "private3_cidr" {
    description = "Provide Private3 Subnet IP cidr range"
    type = string
    default = "10.0.103.0/16"
}

variable "firewall_name" {
  description = "Please provide a firewall name to build a VPC"
  type = string
  default = "allow-http"
}



