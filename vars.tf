variable "regionDefault" {
  type        = string
  default     = "us-east-1"
  description = "Região de criação da Infra"
}

variable "projectName" {
  type    = string
  default = "piklesfastfood"
}

variable "subnet01" {
  type    = string
  default = "subnet-0f66ca21ac6435d4a"
}

variable "subnet02" {
  type    = string
  default = "subnet-011f7c6725a0762c2"
}

variable "subnet03" {
  type    = string
  default = "subnet-09c14a2af7b8cb156"
}

variable "vpcId" {
  type    = string
  default = "vpc-08f3bbc7c4e42c93c"
}

variable "vpcCIDR" {
  type    = string
  default = "172.31.0.0/16"
}

variable "AWSAccount" {
  type    = string
  default = "399256494712"
}

variable "lambda_name" {
  type    = string
  default = "auth"
}

variable "tags" {
  type = map(string)
  default = {
    App = "piklesfastfood"
  }
}

variable username_cognito {
  type        = string
}

variable password_cognito {
  type        = string
}

