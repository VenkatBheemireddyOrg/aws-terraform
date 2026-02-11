### Terraform configuration file

# 1. Define the provider : Specify that you will use the aws provider and the region
# you want to deploy to.

terraform {
    required_providers {
        aws = {
              source  = "hashicorp/aws"
              version = "~> 5.0" # Use a compatible version
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

# 2. Define the ec2 instance resource: use the aws_instance resource block
#to define your ec2 instance

resource "aws_instance" "app_server" {
    ami           = "ami-830c94e3"    #choose a valid AMI ID for your region
    instance_type = "t2.micro"        #choose an appropriate instance

    tags = {
        Name = terraform_demo
    }
}
