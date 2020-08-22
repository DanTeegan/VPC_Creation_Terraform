# This page will deal with any networking needed

# Creating an internet gateway
resource "aws_internet_gateway" "Eng67_Daniel_IGW_Terraform" {
    vpc_id = "${aws_vpc.Eng67_Daniel_VPC_Terraform.id}"
    tags = {
        Name = "Eng67_Daniel_IGW_Terraform"
    }
}

# Creating a route table block of code

resource "aws_route_table" "Eng67_Daniel_RouteTable_Terraform" {
    vpc_id = "${aws_vpc.Eng67_Daniel_VPC_Terraform.id}"
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.Eng67_Daniel_IGW_Terraform.id}" 
    }
    tags = {
        Name = "Eng67_Daniel_RouteTable_Terraform"
    }
}

# Associating the CRT and subnet

resource "aws_route_table_association" "Eng67_Daniel_Subnetlink_Terraform"{
    subnet_id = "${aws_subnet.Eng67_Daniel_Public_Subnet_Terraform.id}"
    route_table_id = "${aws_route_table.Eng67_Daniel_RouteTable_Terraform.id}"
}

# Creating the security groups

resource "aws_security_group" "Eng67_Daniel_SG_Terraform" {
    vpc_id = "${aws_vpc.Eng67_Daniel_VPC_Terraform.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["92.234.30.225/32"]
    }
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Eng67_Daniel_SG_Terraform"
    }
}