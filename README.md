# Creating a VPC using IAC Terraform

##### 1) First things first lets create the following files:
- vpc.tf
- variables.tf
- network.tf
- provider.tf

![](images/1.png)

##### 2) Now we can initialize terraform using the command terraform init
``` terraform init ```

![](images/2.png)

##### 3) Now we can enter the variables.tr file. Here we will be setting all the variables needed to create the VPC
``` variable "aws_region" {  
    default = "eu-west-1a"
}

variable "app_ami_id" {
    type = string
    default = "ami-087fd8ad2539f981d"
    }

```
![](images/3.png)

##### 4) Now we can go inside the provider.tf file and add in our provider. We will be using AWS.

![](images/4.png)

##### 5) 