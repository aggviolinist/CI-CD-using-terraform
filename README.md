# CI-CD-using-terraform
Automate deploying to AWS using Terraform with GitLab CICD pipeline.

## Tools used
### Gitlab
### EC2
### VPC
### S3

# Part 1
## Create all the terraform files we need
- Create the VPC 
 - Add the Subnet and Security group since we want access to port 22
- Create the EC2 
 - It should reference the VPC security id and subnet group
#### We want to reference a module from another module
 - The subnet_ids and security_groups of the VPC module need to be used on EC2 module
 - `child module`- On the VPC Output, reference both subnet_id and security_groups
 - `child module`- Create `subnet-referenced` and `security_group-referenced` as variables in EC2
 - Call them on the `main` using `var.subnet-referenced` & `var.security_group-referenced` respectively
 - `root module` On the main, call both child modules and USE THE NAMES ON THE EC2 CHILD MODULE like: `subnet-referenced = module.vpc.subnet-reference` & `security_group-referenced = module.vpc.security-group-reference`

 ## S3
 - We store our terraform state file in S3
   - That's why we use `backend.tf`
# Part 2
## Using Gitlab to create a CI/CD
- Initialize on gitpod
```sh
git init
```
- Add the gitlab remote repo
```sh
git remote add origin https://gitlab.com/xxxxxxxxxx
```
- Check the status of the repo
```sh
git remote -v
```
- It is not advisable to run our code on main so we need to checkout to branch
```sh
git checkout -b dev
```
- Commit out github code on github
```sh
git add .
git commit -m "initial commit"
git push -u origin dev
```
