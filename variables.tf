# All variables will be stored in this file

variable "aws_region" {  
    default = "eu-west-1a"
}


variable "app_ami_id" {
    type = string
    default = "ami-0ff3472dfb98219da"

    }