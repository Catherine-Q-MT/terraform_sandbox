
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}