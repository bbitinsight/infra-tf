terraform {
  backend "s3" {
    bucket = "terraformstate-demo08102022"
    key    = "ec2/dev/terraform.tfstate"
    region = "us-west-2"
  }
}

