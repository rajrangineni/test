#create vpc
resource "aws_vpc" "test" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="my_vpc"
    }
  
}
#create subnet
resource "aws_subnet" "test" {
    vpc_id = aws_vpc.test.id
    cidr_block = "10.0.0.0/17"
    tags = {
      Name ="RAJSN"
    }
  
}
#create ig
resource "aws_internet_gateway" "test" {
    vpc_id = aws_vpc.test.id
    tags = {
      Name="rajig"
    }
  
}
#create rt
resource "aws_route_table" "test" {
    vpc_id = aws_vpc.test.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.test.id
       
    }
  
}
#create subnet association
resource "aws_route_table_association" "test" {
 
    route_table_id = aws_route_table.test.id
    subnet_id = aws_subnet.test.id
  
}
#create sg group
resource "aws_security_group" "test" {
    vpc_id = aws_vpc.test.id
    tags = {
      Name="test_sg"
    }
     ingress {
        description = "test from vpc"
        from_port = 22
        to_port =22
        protocol ="tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0" ]
    }
  
}
#create ec2
resource "aws_instance" "test" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.test.id
    security_groups = [ aws_security_group.test.id ]
    tags = {
      Name="my ec2"
    }
  
}

