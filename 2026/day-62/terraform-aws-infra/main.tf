resource "aws_vpc" "TerraWeek-VPC-demo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "TerraWeek-VPC-demo"
  }
}

resource "aws_subnet" "TerraWeek-subnet-demo" {
  vpc_id = aws_vpc.TerraWeek-VPC-demo.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "igw-terraform-demo" {
  vpc_id = aws_vpc.TerraWeek-VPC-demo.id
  tags = {
    Name = "Terraweek-IGW"
  }
}

resource "aws_egress_only_internet_gateway" "aws_egress_igw" {
  vpc_id = aws_vpc.TerraWeek-VPC-demo.id

  tags = {
    Name = "aws-egress-igw-demo"
  }
}

resource "aws_route_table" "aws-route-table-demo" {
  vpc_id = aws_vpc.TerraWeek-VPC-demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-terraform-demo.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.aws_egress_igw.id
  }

  tags = {
    Name = "terraWeek-public-route-table"
  }
}

resource "aws_route_table_association" "route-table-association-demo" {
  subnet_id      = aws_subnet.TerraWeek-subnet-demo.id
  route_table_id = aws_route_table.aws-route-table-demo.id
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.TerraWeek-VPC-demo.id

  tags = {
    Name = "TerraWeek-SG"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}





resource "aws_instance" "example" {
  ami           = "ami-0d76b909de1a0595d"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.TerraWeek-subnet-demo.id
  associate_public_ip_address = true

  tags = {
    Name = "TerraWeek-Server"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket" "s3_bucket-demo" {
  depends_on = [aws_instance.example]
  bucket = "jameel123-bucket-s3"
}