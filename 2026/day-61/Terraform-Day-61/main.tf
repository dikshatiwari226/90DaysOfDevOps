resource "aws_s3_bucket" "demo_project_bucket" {
    bucket = "day61-bucket-terraform"
  tags = {
    Name = "my-demo-project-bucket"
    environment = "dev"
  }
}

resource "aws_instance" "dummy-instance-day61" {
  ami = "ami-0d76b909de1a0595d"
  instance_type = "t3.micro"
  tags = {
    Name = "Terraweek-Modified"
  }
}
