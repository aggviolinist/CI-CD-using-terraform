#1. Creating a VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc-cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "Test VPC"
    }  
}
#2. Creating a Subnet 
resource "aws_subnet" "our-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.our-subnet-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
      Name = "Our Subnet"
    } 
}
#3. Creating a Security Group
resource "aws_security_group" "our-security-group" {
    name = "EC2 SSH Access"
    description = "EC2 SSH Access"
    vpc_id = aws_vpc.vpc.id

    ingress {
        description = "We are giving EC2 port 22 access to our VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Our Security Group"
    }
    }