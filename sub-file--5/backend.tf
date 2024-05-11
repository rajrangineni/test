terraform {
  backend "s3" {
    bucket = "statefile-store4"
    key = "folder1/terraform.tfstate"
    region = "ap-south-1"
    
  }
}