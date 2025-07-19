# root file

module "vpc" {
    source = "./vpc"  
}

module "ec2" {
    source = "./ec2"
    subnet-used = module.vpc.subnet-reference
    security_group-used = module.vpc.security-group-reference  
}