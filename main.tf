# root file

module "vpc" {
    source = "./vpc"  
}

module "ec2" {
    source = "./ec2"
    subnet-referenced = module.vpc.subnet-reference
    security_group-referenced = module.vpc.security-group-reference
}

