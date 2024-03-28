resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "MyTerraformvpc"
    
    }
}
resource "aws_subnet" "publicsubnet"{
    vpc_id =aws_vpc.myvpc.id
    cidr_block ="10.0.1.0/24"
}
resource "aws_subnet" "publicsubnets"{
    vpc_id =aws_vpc.myvpc.id
    cidr_block ="10.0.3.0/24"
}
resource "aws_subnet" "privatesubnet"{
    vpc_id =aws_vpc.myvpc.id
    cidr_block ="10.0.2.0/24"
}    


resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "publicRt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}