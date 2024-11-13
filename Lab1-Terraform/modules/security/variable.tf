variable "region" {
  type = string
  default = "ap-southeast-1"
}
variable "vpc_id" {
  type = string
  description = "The VPC ID"
  nullable = false
  
}

variable "user_ip" {
  type =  string
  description = "Use IP to connect to Public instance"
}