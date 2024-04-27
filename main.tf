provider "aws" { // es importante escribir el nombre real del proveedor a usar
  shared_config_files =["C:\\Users\\javie\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\javie\\.aws\\credentials"]
}
//crear vpc, aws no inventarse, derecha si
resource "aws_vpc" "fis_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.fis_vpc.id
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.fis_vpc.id
}
resource "aws_internet_gateway" "fis_public_internt_gateway" {
    vpc_id = aws_vpc.fis_vpc.id
}

resource "aws_route_table" "fis-public_subnet_route_table" {
  vpc_id = aws_vpc.fis_vpc.id
    //elemnto dentro del recurso, lo llamaremos ruta, bloque dentro de otro bloque

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fis_public_internt_gateway.id

  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.fis_public_internt_gateway.id
  }
  

}
resource "aws_route_table_association" "fis_public_association" {
    route_table_id = aws_route_table.fis-public_subnet_route_table.id
    subnet_id = aws_subnet.public_subnet.id
}