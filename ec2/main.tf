# Creating an EC2
resource "aws_instance" "our-ec2-instance" {
    ami = "ami-0150ccaf51ab55a51"
    instance_type = "t2.micro"
    subnet_id = var.subnet-referenced
    security_groups = [var.security_group-referenced]

    tags = {
      Name = "Our EC2 instance"
    }
}