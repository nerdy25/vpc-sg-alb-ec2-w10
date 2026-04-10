terraform {
  backend "s3" {
    bucket = "terraformstate-tay"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}