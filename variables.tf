variable "ami" {
    description = "Amazon machine image"
    type = string
    default = "ami-05b10e08d247fb927"
  
}

variable "instance_type" {
    default = "t2.micro"
}

variable "region_name" {
    default = "us-east-1"
}

variable "profile_name" {
    default = "default"
}