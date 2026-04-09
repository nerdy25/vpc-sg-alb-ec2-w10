terraform {
  backend "s3" {
    bucket = "terraformstate-tay"
    key    = "terraform.tfstate"
    region = "us-east-2" # fix: change from us-east-1 to us-east-2
  }
}