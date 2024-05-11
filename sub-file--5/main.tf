provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_instance" "main" {
    ami = "ami-013e83f579886baeb"
    instance_type = "t2.micro"
    key_name = "mykey"
    tags = {
      Name = "raj21"
    }
  
}