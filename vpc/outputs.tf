output "subnet-reference" {
    value = aws_subnet.our-subnet.id  
}
output "security-group-reference" {
    value = aws_security_group.our-security-group.id  
}