# This will be the VPC creation file


# VPC Creation block of code
resource "aws_vpc" "Eng67.Daniel.VPC.Terraform" {
    cidr_block = "10.10.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags {
        Name = "Eng67.Daniel.VPC.Terraform"
    }
}


# Creation of public subnet 
resource "aws_subnet" "Eng67.Daniel.Public.Subnet.Terraform" {
    vpc_id = "10.10.0.0/16"
    cidr_block = "10.10.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = var.aws_region
    tags {
        Name = "Eng67.Daniel.Public.Subnet.Terraform"
    }
}

# Creation of private subnet 
resource "aws_subnet" "Eng67.Daniel.Private.Subnet.Terraform" {
    vpc_id = "10.10.0.0/16"
    cidr_block = "10.10.2.0/24"
    map_public_ip_on_launch = "false" //it makes this a private subnet
    availability_zone = var.aws_region
    tags {
        Name = "Eng67.Daniel.Private.Subnet.Terraform"
    }
}
