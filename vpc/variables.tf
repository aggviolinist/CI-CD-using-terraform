variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "This is our VPC"
  type = string
}
variable "our-subnet-cidr" {
    default = "10.0.1.0/24"
    description = "This is the subnet we are gonna use"
    type = string  
}