terraform {
  backend "s3" {
    bucket = "bucko-yangu"
    key    = "state"
    region = "us-east-1"
    dynamodb_table = "backend"
  }
}
