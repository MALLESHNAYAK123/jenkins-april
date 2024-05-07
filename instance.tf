resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc",
    "tag" = "tag1"
  }
}
resource "aws_subnet" "snpv1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "snpv1"
    "tags" = "tags2"
  }
}

resource "aws_subnet" "snpv2" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "snpv2"
    "tags" = "tags3"
  }
}

resource "aws_subnet" "snpub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "snpub3"
    "tags" = "tags4"
  }
}

resource "aws_subnet" "snpub4" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "snpub4"
    "tags" = "tags5"
  }
}

resource "aws_eip" "lb" {

}

resource "aws_nat_gateway" "nat1" {
  allocation_id  = aws_eip.lb.id
  subnet_id         = aws_subnet.snpv1.id
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "igw"
    "tags" = "tag6"
  }
}
resource "aws_route_table" "rtpub" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt-pub"
  }
}
resource "aws_route_table" "rtpv" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }
  tags = {
    Name = "rt-pv"
  }
}
resource "aws_route_table_association" "assos-pub" {
  subnet_id      = aws_subnet.snpub.id
  route_table_id = aws_route_table.rtpub.id
}
resource "aws_route_table_association" "assos-pv" {
  subnet_id      = aws_subnet.snpv1.id
  route_table_id = aws_route_table.rtpv.id
}
resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "Allow all inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = "my-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my-sg.id
  cidr_ipv4         =  aws_vpc.my-vpc.cidr_block
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080

}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
