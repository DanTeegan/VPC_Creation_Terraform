# This will be the VPC creation file


# VPC Creation block of code
resource "aws_vpc" "Eng67_Daniel_VPC_Terraform" {
    cidr_block = "10.20.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"     
}


# Creation of public subnet 
resource "aws_subnet" "Eng67_Daniel_Public_Subnet_Terraform" {
    vpc_id = "${aws_vpc.Eng67_Daniel_VPC_Terraform.id}"
    cidr_block = "10.20.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = var.aws_region
    tags = {
        Name = "Eng67_Daniel_Public_Subnet_Terraform"
    }
}
# Creation of private subnet 
resource "aws_subnet" "Eng67_Daniel_Private_Subnet_Terraform" {
    vpc_id = "${aws_vpc.Eng67_Daniel_VPC_Terraform.id}"
    cidr_block = "10.20.2.0/24"
    map_public_ip_on_launch = "false" //it makes this a private subnet
    availability_zone = var.aws_region
    tags = {
        Name = "Eng67_Daniel_Private_Subnet_Terraform"
    }
}


# Creating the EC2 instance

resource "aws_instance" "Eng67_Daniel_EC2_Terraform" {
    ami = "${var.app_ami_id}"
    instance_type = "t2.micro"
    key_name = "DevOpsStudents"
    associate_public_ip_address = true
    tags = {
      Name = "eng67.Daniel.Terraform.EC2.App"
    }

    # VPC
    subnet_id = "${aws_subnet.Eng67_Daniel_Public_Subnet_Terraform.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.Eng67_Daniel_SG_Terraform.id}"]
}